# Creating a SQLite Database

# import sqlite3

# connect to SQLite database
# conn = sqlite3.connect("Database/customer_churn.db")

# print('Database created successfully!')

# Close connection
# conn.close()

import sqlite3

# Connect to the SQLite database (creates it if it doesn't exist)
conn = sqlite3.connect("database/customer_churn.db")
cursor = conn.cursor()

print("Database connected successfully!")

# Define table schema
cursor.execute("""
CREATE TABLE IF NOT EXISTS customers (
    customerID TEXT PRIMARY KEY,
    gender TEXT,
    SeniorCitizen INTEGER,
    Partner TEXT,
    Dependents TEXT,
    tenure INTEGER,
    PhoneService TEXT,
    MultipleLines TEXT,
    InternetService TEXT,
    OnlineSecurity TEXT,
    OnlineBackup TEXT,
    DeviceProtection TEXT,
    TechSupport TEXT,
    StreamingTV TEXT,
    StreamingMovies TEXT,
    Contract TEXT,
    PaperlessBilling TEXT,
    PaymentMethod TEXT,
    MonthlyCharges REAL,
    TotalCharges TEXT,
    Churn TEXT
);
""")

print("Table 'customers' created successfully!")

# Commit changes and close connection
conn.commit()
conn.close()