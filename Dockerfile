# get the base container
FROM ubuntu:20.04

# the password of the SA user will be this value
ENV MSSQL_SA_PASSWORD "Un!q@to2023"
ENV ACCEPT_EULA "Y"
ENV SSQL_PID "Evaluation"

# install requirements
RUN apt update -y && apt install -y gpg curl ca-certificates wget software-properties-common
COPY ./mssql-service /etc/init.d/mssql-server
RUN chmod 755 /etc/init.d/mssql-server

# installation of mssql. see: https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16&tabs=ubuntu2004
RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc && \
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"
RUN apt update -y && apt install -y mssql-server

# run setup
RUN /opt/mssql/bin/mssql-conf set-sa-password
RUN service mssql-server start


# expose the port
EXPOSE 1433

# security
RUN adduser dbuser --disabled-login
RUN chmod 777 /var/opt/mssql/log/errorlog && ln /var/opt/mssql/log/errorlog /home/dbuser/errorlog
WORKDIR /home/dbuser
USER 1000:1000

#  show logs
ENTRYPOINT ["tail", "-n","1000", "-F", "/home/dbuser/errorlog"]
