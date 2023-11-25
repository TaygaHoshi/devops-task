# devops-task
Usage:
```bash
# Be sure this user is in the Docker group so that it can execute Docker commands without sudo.

git clone https://github.com/TaygaHoshi/devops-task.git
cd devops-task
chmod u+x ./launcher.sh
./launcher.sh

# After the Docker containers are up, wait approximately 20 seconds for the MSSQL instance to initialize and then
# go to http://localhost:80/index.php
```

## Changes in QuickDbTest.php
To allow connection without proper SSL:
```php
# Change the line from
$dsn = "sqlsrv:server=".self::host.";Database=".self::db;

# to
$dsn = "sqlsrv:server=".self::host.";Database=".self::db.";TrustServerCertificate=true";
```

## Tree View

![Tree view](/screenshots/tree.png)

## Screenshot

Result screenshot:

![Result](/screenshots/screenshot.png)
