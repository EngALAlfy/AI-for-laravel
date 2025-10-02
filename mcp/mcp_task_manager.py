class MCPTaskManager:
    def __init__(self, db):
        self.db = db
        self._setup_tables()

    def _setup_tables(self):
        self.db.execute("""
        CREATE TABLE IF NOT EXISTS lists (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(255) NOT NULL UNIQUE
        ) ENGINE=InnoDB;
        """)
        self.db.execute("""
        CREATE TABLE IF NOT EXISTS tasks (
            id INT AUTO_INCREMENT PRIMARY KEY,
            title VARCHAR(255) NOT NULL,
            status VARCHAR(50) DEFAULT 'pending',
            due_date VARCHAR(50),
            list_id INT,
            UNIQUE(title, list_id),
            FOREIGN KEY(list_id) REFERENCES lists(id) ON DELETE CASCADE
        ) ENGINE=InnoDB;
        """)

    def add_task(self, title, list_name, due_date=None):
        self.db.execute("INSERT IGNORE INTO lists (name) VALUES (%s)", (list_name,))
        self.db.execute("SELECT id FROM lists WHERE name=%s", (list_name,))
        list_id = self.db.fetchone()[0]
        # Prevent duplicate by title+list_id
        self.db.execute("SELECT id FROM tasks WHERE title=%s AND list_id=%s", (title, list_id))
        if self.db.fetchone():
            return f"⚠️ Task '{title}' already exists in list '{list_name}'"
        self.db.execute(
            "INSERT INTO tasks (title, due_date, list_id) VALUES (%s, %s, %s)",
            (title, due_date, list_id)
        )
        return f"✅ Task '{title}' added to list '{list_name}' (due: {due_date or 'no date'})"

    def list_tasks(self, list_name=None, due_date=None):
        query = ("SELECT tasks.id, tasks.title, tasks.status, tasks.due_date, lists.name "
                 "FROM tasks JOIN lists ON tasks.list_id = lists.id WHERE 1=1")
        params = []
        if list_name:
            query += " AND lists.name=%s"
            params.append(list_name)
        if due_date:
            query += " AND due_date=%s"
            params.append(due_date)
        self.db.execute(query, tuple(params))
        rows = self.db.fetchall()
        return [
            {"id": r[0], "title": r[1], "status": r[2], "due_date": r[3], "list": r[4]}
            for r in rows
        ]

    def update_status(self, task_id, status):
        self.db.execute("UPDATE tasks SET status=%s WHERE id=%s", (status, task_id))
        return f"🔄 Task id={task_id} status updated to {status}"

    def update_due_date(self, task_id, due_date):
        self.db.execute("UPDATE tasks SET due_date=%s WHERE id=%s", (due_date, task_id))
        return f"🔄 Task id={task_id} due date updated to {due_date}"

    def update_title(self, task_id, new_title):
        self.db.execute("UPDATE tasks SET title=%s WHERE id=%s", (new_title, task_id))
        return f"🔄 Task id={task_id} title updated to {new_title}"

    def update_list(self, task_id, new_list_name):
        self.db.execute("INSERT IGNORE INTO lists (name) VALUES (%s)", (new_list_name,))
        self.db.execute("SELECT id FROM lists WHERE name=%s", (new_list_name,))
        new_list_id = self.db.fetchone()[0]
        self.db.execute("UPDATE tasks SET list_id=%s WHERE id=%s", (new_list_id, task_id))
        return f"🔄 Task id={task_id} moved to list {new_list_name}"

    def update_list_id(self, task_id, new_list_id):
        self.db.execute("UPDATE tasks SET list_id=%s WHERE id=%s", (new_list_id, task_id))
        return f"🔄 Task id={task_id} moved to list id {new_list_id}"

    def add_list(self, list_name):
        self.db.execute("INSERT IGNORE INTO lists (name) VALUES (%s)", (list_name,))
        self.db.execute("SELECT id FROM lists WHERE name=%s", (list_name,))
        list_id = self.db.fetchone()[0]
        return {"id": list_id, "name": list_name}

    def update_list(self, list_id, new_name):
        self.db.execute("UPDATE lists SET name=%s WHERE id=%s", (new_name, list_id))
        return f"🔄 List id={list_id} renamed to {new_name}"

    def delete_list(self, list_id):
        self.db.execute("DELETE FROM lists WHERE id=%s", (list_id,))
        return f"🗑️ List id={list_id} and its tasks deleted"

    def list_lists(self):
        self.db.execute("SELECT id, name FROM lists")
        return [{"id": row[0], "name": row[1]} for row in self.db.fetchall()]

    def update_task(self, title, status):
        self.db.execute("UPDATE tasks SET status=%s WHERE title=%s", (status, title))
        return f"🔄 Task '{title}' updated to {status}"

    def delete_task(self, title):
        self.db.execute("DELETE FROM tasks WHERE title=%s", (title,))
        return f"🗑️ Task '{title}' deleted"
