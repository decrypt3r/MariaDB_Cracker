
import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  database="mysql"
)
mycursor = mydb.cursor()
a = input("Enter Password:")
flush = "FLUSH PRIVILEGES"
mycursor.execute("UPDATE user SET password=PASSWORD('%s') WHERE User='root' AND Host = 'localhost'" % a)
mycursor.execute(flush)
mydb.commit()
