FROM mcr.microsoft.com/mssql/server:2019-latest
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=#BC_12345#
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=1433

USER mssql

COPY DockerDatabase.bak /var/opt/mssql/backup/
COPY Restore.sql /var/opt/mssql/backup/Restore.sql

RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" && /opt/mssql-tools/bin/sqlcmd -Slocalhost -USA -P$SA_PASSWORD -i"/var/opt/mssql/backup/Restore.sql"