#Creating a SQLite Database

import sqlite3

#connect to SQLite database
conn = sqlite3.connect("Database/customer_churn.db")

print('Database created successfully!')

#Close connection
conn.close()