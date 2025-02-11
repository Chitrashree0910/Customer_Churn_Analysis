# Loading the dataset from the CSV file into the database
 
import sqlite3
import pandas as pd

# Connecting to the SQLite Database
conn = sqlite3.connect("Database/customer_churn.db")
cursor = conn.cursor()

# Load the CSV data into a pandas Dataframe
df = pd.read_csv("Data/Customer_Churn_Dataset.csv")

# Display first few rows to verify the data
print("Sample data from CSV: ")
print(df.head())

# Insert data into SQLite Database
df.to_sql("customers", conn, if_exists = "append", index = False)

print("Data imported successfully")

# Close connection
conn.close()