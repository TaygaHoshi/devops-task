# get the base container
FROM ubuntu:20.04

# the password of the SA user will be this value
ENV MSSQL_SA_PASSWORD "Un!q@to2023"
ENV ACCEPT_EULA Y

# set mssql binaries in path to allow usage
ENV PATH "$PATH:/opt/mssql-tools18/bin"

# install requirements
RUN apt update -y && apt install -y gpg curl ca-certificates wget software-properties-common

# installation of mssql. see: https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver16&tabs=ubuntu2204
RUN curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc && \
add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"
RUN apt update -y && apt install -y mssql-server

# run setup
RUN /opt/mssql/bin/mssql-conf set-sa-password

# expose the port
EXPOSE 1433

# security
RUN adduser dbuser --disabled-login
WORKDIR /home/dbuser
USER 1000:1000

#  keep the container open
ENTRYPOINT ["sleep", "infinity"]
