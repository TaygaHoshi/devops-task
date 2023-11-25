FROM php:8.2

RUN apt update -y && apt install unixodbc-dev -y

RUN mkdir -p /etc/php/8.2/mods-available

RUN pecl install sqlsrv && \
pecl install pdo_sqlsrv&& \
printf "; priority=20\nextension=sqlsrv.so\n" > /etc/php/8.2/mods-available/sqlsrv.ini && \
printf "; priority=30\nextension=pdo_sqlsrv.so\n" > /etc/php/8.2/mods-available/pdo_sqlsrv.ini && \
exit && \
phpenmod sqlsrv pdo_sqlsrv

RUN apt install gpg -y

RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg && \
curl https://packages.microsoft.com/config/debian/12/prod.list | tee /etc/apt/sources.list.d/mssql-release.list

RUN apt update -y && ACCEPT_EULA=Y apt install -y msodbcsql18 


EXPOSE 80
WORKDIR /app

ENTRYPOINT php -S localhost:80