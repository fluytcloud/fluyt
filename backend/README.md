The backend depends on several external services, such as: the postgres database and keycloak. To upload all these services you must have docker installed on your machine and run the following command:

```shell
docker compose up
```

To start development with a minimal keycloak and application configuration, run the following commands to restore the databases:

```shell
cat postgres-keycloak-backup.sql | docker exec -i postgres psql -U root -d fluyt
cat postgres-app-backup.sql | docker exec -i postgres psql -U root -d fluyt
```

When the database restoration is complete, you can use the following users to connect to the system:

| User                   | Password | Role         | Schema                    |
|------------------------|----------|--------------|---------------------------|
| admin                  | 123      | admin        | admin                     |
| manager@fluyt.com      | 123      | manager      | manager                   |
| user@fluyt.com         | 123      | user         | user                      |
| multi-tenant@fluyt.com | 123      | manager/user | manager/user/multi-tenant |
| test                   | 123      | manager/user | manager/user/multi-tenant |

If you want to perform a new backup of the databases, run the following commands:

```shell
docker exec -i postgres-keycloak /usr/bin/pg_dumpall -U root > postgres-keycloak-backup.sql
docker exec -i postgres-app /usr/bin/pg_dumpall -U root > postgres-app-backup.sql
```