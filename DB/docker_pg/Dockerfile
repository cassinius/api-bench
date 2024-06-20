FROM postgres:latest as dumper

# That file does the DB initialization but also runs the Postgres daemon; by removing the last line it will only init
RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="postgres"
ENV PGDATA=/data

COPY prepare-db.sql /docker-entrypoint-initdb.d/
COPY retailer_api_pg_16.sql /docker-entrypoint-initdb.d/

RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"] 

FROM postgres:latest as postgres-retailer

COPY --from=dumper /data $PGDATA
