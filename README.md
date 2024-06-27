# temporalite-container-image ![Docker Image Version (latest semver)](https://img.shields.io/docker/v/slamdev/temporalite) ![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/slamdev/temporalite)

```bash
docker run --rm -p7233:7233 -p8233:8233 slamdev/temporalite:0.3.0
```

UPDATE: officil image can be used now. Sow the repo is archived.

```yaml
  temporal:
    # https://hub.docker.com/r/temporalio/server/tags
    image: temporalio/server:1.21.5.0
    restart: on-failure
    user: "0:0" # running as root to avoid permission issues with writing to /tmp/sqlite/db
    entrypoint:
      - temporal
      - server
      - start-dev
      - --namespace=default
      - --db-filename=/tmp/sqlite/db
      - --ip=0.0.0.0
    tmpfs:
      - /tmp/sqlite
    ports:
      - "7233:7233"
      - "8233:8233"
```
