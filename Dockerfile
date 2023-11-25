FROM mcr.microsoft.com/mssql/server:2022-latest

# environment variables
ENV MSSQL_SA_PASSWORD "Un!q@to2023"
ENV ACCEPT_EULA "Y"
ENV SSQL_PID "Developer"
ENV DB_NAME "db_vero_digital"

EXPOSE 1433

# create the necessary database
CMD /opt/mssql/bin/sqlservr & \
sleep 20 && \
echo -e "CREATE DATABASE $DB_NAME \n GO" | /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $MSSQL_SA_PASSWORD

ENTRYPOINT /opt/mssql/bin/sqlservr