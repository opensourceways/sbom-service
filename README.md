# sbom-service


## Run in Docker

Database configures, such as *host/port/db_name* are passed to the container via
environment variables.

Sensitive data, such as *password*, are passed by *docker secret*.

1. `docker swarm init`
2. `printf {your_db_user_password} | docker secret create db_password -`
3. `docker build . -t sbom-service`
4. ```
    docker service create 
    --secret="db_password" \
    --publish published={your_host_port},target={your_container_port} \
    -e DB_HOST="{your_db_host}" \
    -e DB_PORT="{your_db_port}" \
    -e DB_NAME="{your_db_name}" \
    -e DB_USERNAME="{your_db_username}" \
    -e DB_PASSWORD_FILE="/run/secrets/db_password" \
    sbom-service
    ```
