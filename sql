import sqlite3

conn = sqlite3.connect("LoginData.db")
cursor = conn.cursor()

# Create table (minimal version)
cursor.execute("""
CREATE TABLE IF NOT EXISTS USERS (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
)
""")

# Insert users
cursor.execute("""
INSERT OR IGNORE INTO USERS (first_name, last_name, email, password)
VALUES (?, ?, ?, ?)
""", ("tester", "test", "tester@gmail.com", "tester"))

cursor.execute("""
INSERT OR IGNORE INTO USERS (first_name, last_name, email, password)
VALUES (?, ?, ?, ?)
""", ("Greg", "Friday", "m2400611@middlesbro.ac.uk", "password"))

conn.commit()

# Show data
cursor.execute("SELECT * FROM USERS")
for row in cursor.fetchall():
    print(row)

conn.close()
