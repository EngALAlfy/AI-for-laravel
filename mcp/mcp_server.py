# mcp_server.py
import sqlite3
from fastmcp import FastMCP

app = FastMCP("SQLiteMCP")

# ---------------- Database Setup ---------------- #
conn = sqlite3.connect("tasks.db", check_same_thread=False)
cursor = conn.cursor()

cursor.execute("""
CREATE TABLE IF NOT EXISTS lists (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS tasks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    status TEXT DEFAULT 'pending',
    due_date TEXT,
    list_id INTEGER,
    FOREIGN KEY(list_id) REFERENCES lists(id)
)
""")

conn.commit()

# ---------------- MCP Tools ---------------- #

@app.tool()
def add_task(title: str, list_name: str, due_date: str = None) -> str:
    """Add a task into a specific list"""
    cursor.execute("INSERT OR IGNORE INTO lists (name) VALUES (?)", (list_name,))
    conn.commit()

    cursor.execute("SELECT id FROM lists WHERE name=?", (list_name,))
    list_id = cursor.fetchone()[0]

    cursor.execute(
        "INSERT INTO tasks (title, due_date, list_id) VALUES (?, ?, ?)",
        (title, due_date, list_id)
    )
    conn.commit()
    return f"✅ Task '{title}' added to list '{list_name}' (due: {due_date or 'no date'})"

@app.tool()
def list_tasks(list_name: str = None, due_date: str = None) -> list:
    """Return tasks filtered by list or due date"""
    query = """SELECT tasks.title, tasks.status, tasks.due_date, lists.name
               FROM tasks JOIN lists ON tasks.list_id = lists.id WHERE 1=1"""
    params = []
    if list_name:
        query += " AND lists.name=?"
        params.append(list_name)
    if due_date:
        query += " AND due_date=?"
        params.append(due_date)

    cursor.execute(query, tuple(params))
    rows = cursor.fetchall()
    return [
        {"title": r[0], "status": r[1], "due_date": r[2], "list": r[3]}
        for r in rows
    ]

@app.tool()
def update_task(title: str, status: str) -> str:
    """Update the status of a task"""
    cursor.execute("UPDATE tasks SET status=? WHERE title=?", (status, title))
    conn.commit()
    return f"🔄 Task '{title}' updated to {status}"

@app.tool()
def delete_task(title: str) -> str:
    """Delete a task by title"""
    cursor.execute("DELETE FROM tasks WHERE title=?", (title,))
    conn.commit()
    return f"🗑️ Task '{title}' deleted"

# ---------------- Run MCP Server ---------------- #
if __name__ == "__main__":
    app.run(transport="sse", host="127.0.0.1", port=9000)
