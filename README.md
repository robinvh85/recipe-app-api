# recipe-app-api

# Command

```bash
docker-compose run app sh -c "python manage.py createsuperuser"
docker-compose run app sh -c "python manage.py test && flake8"
docker-compose run app sh -c "python manage.py makemigrations"
docker-compose run app sh -c "python manage.py migrate"
```
