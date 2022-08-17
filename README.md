## Working with database
### Create user and db
```commandline
psql --username postgres -c "CREATE ROLE request WITH PASSWORD '111111' LOGIN;"
createdb --username postgres --owner request request
```
### Drop db and role
```commandline
dropdb request
psql
```
```postgresql
drop user request
```
### Create superuser
```commandline
python manage.py createsuperuser --username admin
```
## Run project
### Backend
```commandline
docker-compose build
docker-compose up
```
