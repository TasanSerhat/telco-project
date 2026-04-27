#!/bin/bash

echo "Starting Database Initialization and Seeding..."

echo "1) Creating Tables..."
sqlplus telco/telco@//localhost/XEPDB1 @/container-entrypoint-initdb.d/tables.ddl

echo "2) Loading TARIFFS data..."
sqlldr userid=telco/telco@//localhost/XEPDB1 control=/container-entrypoint-initdb.d/tariffs.ctl log=/tmp/tariffs.log

echo "3) Loading CUSTOMERS data..."
sqlldr userid=telco/telco@//localhost/XEPDB1 control=/container-entrypoint-initdb.d/customers.ctl log=/tmp/customers.log

echo "4) Loading MONTHLY_STATS data..."
sqlldr userid=telco/telco@//localhost/XEPDB1 control=/container-entrypoint-initdb.d/monthly_stats.ctl log=/tmp/monthly_stats.log

echo "Database Initialization Completed Successfully!"
