import mysql.connector
import os

#####skip-grants-table#####
os.system('systemctl stop mariadb')
os.system('systemctl set-environment MYSQLD_OPTS="--skip-grant-tables"')
os.system('systemctl start mariadb')
###########################

#####Main-Code#####
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
####################

#####Unset-skipping#####
os.system('systemctl stop mariadb')
os.system('systemctl unset-environment MYSQLD_OPTS')
os.system('systemctl start mariadb')
########################
