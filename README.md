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

### env.local file
Generate secret key and put in your env.local file
```python
from django.core.management.utils import get_random_secret_key
print(get_random_secret_key())
```
```env.local
...some settings
SECRET_KEY_VALUE_ENV=genarated key from stdout
```
Put your database password too

## Run tests
First you need to update role
```postgresql
ALTER USER request CREATEDB;
```
Second tests
```commandline
cd app
python manage.py test
```