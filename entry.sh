#!/bin/bash
echo "Waiting for 30 seconds before trying to create a database to give MSSQL time to initialize." &&
sleep 30 &&
echo -e "CREATE DATABASE $DB_NAME \n GO" | /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD &&
/opt/mssql/bin/sqlservr