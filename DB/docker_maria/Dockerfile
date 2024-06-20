FROM mariadb:latest as builder

# That file does the DB initialization but also runs mysql daemon, by removing the last line it will only init
RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV MARIADB_ROOT_PASSWORD="retailer"

COPY prepare-db.sql /docker-entrypoint-initdb.d/
COPY retailer_api_mariadb.sql /docker-entrypoint-initdb.d/

RUN chmod -R 775 /docker-entrypoint-initdb.d

# Need to change the datadir to something else than /var/lib/mysql because the parent docker file defines it as a volume.
# https://docs.docker.com/engine/reference/builder/#volume :
#       Changing the volume from within the Dockerfile: If any build steps change the data within the volume after
#       it has been declared, those changes will be discarded.
RUN ["/usr/local/bin/docker-entrypoint.sh", "mariadbd", "--datadir", "/initialized-db"]

FROM mariadb:latest as maria-retailer

COPY --from=builder /initialized-db /var/lib/mysql
