from fastmcp import FastMCP
from .mysql_connector import MySQLConnector
from .mcp_task_manager import MCPTaskManager

# ---------------- MCP App Setup ---------------- #
app = FastMCP("MySQLMCP")

# Configure your MySQL connection here
mysql_db = MySQLConnector(
    host="localhost",
    user="your_user",
    password="your_password",
    database="your_database"
)
task_manager = MCPTaskManager(mysql_db)

@app.tool()
def add_task(title: str, list_name: str, due_date: str = None) -> str:
    """Add a task into a specific list"""
    return task_manager.add_task(title, list_name, due_date)

@app.tool()
def list_tasks(list_name: str = None, due_date: str = None) -> list:
    """Return tasks filtered by list or due date"""
    return task_manager.list_tasks(list_name, due_date)

@app.tool()
def update_task(title: str, status: str) -> str:
    """Update the status of a task"""
    return task_manager.update_task(title, status)

@app.tool()
def delete_task(title: str) -> str:
    """Delete a task by title"""
    return task_manager.delete_task(title)

@app.tool()
def update_task_status(task_id: int, status: str) -> str:
    """Update the status of a task by id"""
    return task_manager.update_status(task_id, status)

@app.tool()
def update_task_due_date(task_id: int, due_date: str) -> str:
    """Update the due date of a task by id"""
    return task_manager.update_due_date(task_id, due_date)

@app.tool()
def update_task_title(task_id: int, new_title: str) -> str:
    """Update the title of a task by id"""
    return task_manager.update_title(task_id, new_title)

@app.tool()
def update_task_list(task_id: int, new_list_name: str) -> str:
    """Update the list of a task by id"""
    return task_manager.update_list(task_id, new_list_name)

@app.tool()
def update_task_list_id(task_id: int, new_list_id: int) -> str:
    """Move a task to another list by list id"""
    return task_manager.update_list_id(task_id, new_list_id)

@app.tool()
def add_list(list_name: str) -> dict:
    """Add a new list and return its id and name"""
    return task_manager.add_list(list_name)

@app.tool()
def update_list(list_id: int, new_name: str) -> str:
    """Rename a list by id"""
    return task_manager.update_list(list_id, new_name)

@app.tool()
def delete_list(list_id: int) -> str:
    """Delete a list and all its tasks by id"""
    return task_manager.delete_list(list_id)

@app.tool()
def list_lists() -> list:
    """Return all lists with their ids and names"""
    return task_manager.list_lists()

# ---------------- Run MCP Server ---------------- #
if __name__ == "__main__":
    app.run()
    # app.run(transport="sse", host="127.0.0.1", port=9000)
