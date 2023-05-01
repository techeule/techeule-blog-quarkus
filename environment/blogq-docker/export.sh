
HERE_FOLDER=$(dirname $0)
ROOT_FOLDER=$(cd "$HERE_FOLDER" ; cd ../../ ; pwd)

set -x

mkdir -p target

pg_dump --file=target/Local_Keycloak.sql --format=p --clean --if-exists --column-inserts --username=oidc_keycloak --host=localhost --port=25432

rm ${ROOT_FOLDER}/environment/blogq-docker/blogq-sql-database/init-db-keycloak.sql
touch ${ROOT_FOLDER}/environment/blogq-docker/blogq-sql-database/init-db-keycloak.sql

cat >> ${ROOT_FOLDER}/environment/blogq-docker/blogq-sql-database/init-db-keycloak.sql <<EOL
CREATE USER oidc_keycloak WITH PASSWORD 'oidc-keycloak-password';
CREATE DATABASE oidc_keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
ALTER DATABASE oidc_keycloak OWNER TO "oidc_keycloak";
EOL

cat >> ${ROOT_FOLDER}/environment/blogq-docker/blogq-sql-database/init-db-keycloak.sql <<EOL

\connect oidc_keycloak

EOL

cat target/Local_Keycloak.sql >> ${ROOT_FOLDER}/environment/blogq-docker/blogq-sql-database/init-db-keycloak.sql

cat >> ${ROOT_FOLDER}/environment/blogq-docker/blogq-sql-database/init-db-keycloak.sql <<EOL
GRANT ALL ON DATABASE oidc_keycloak TO oidc_keycloak;
GRANT ALL PRIVILEGES ON DATABASE oidc_keycloak TO oidc_keycloak;
EOL
