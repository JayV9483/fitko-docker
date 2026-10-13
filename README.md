
### Run databases

```bash
docker run -d --name postgres-database-fitko \
  -e POSTGRES_USER=appuser \
  -e POSTGRES_PASSWORD=s3cret \
  -e POSTGRES_DB=appdb \
  -p 5432:5432 \
  -v ./pgdata/fitko:/var/lib/postgresql/data \
  postgres:17

docker run -d --name postgres-database-chat \
  -e POSTGRES_USER=appuser \
  -e POSTGRES_PASSWORD=s3cret \
  -e POSTGRES_DB=appdb \
  -p 5433:5432 \
  -v ./pgdata/chat:/var/lib/postgresql/data \
  postgres:17
```
