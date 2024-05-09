# Requirements?
 - python 3.10.6
 - See requirements.txt file for the rest

# How to run?
 - Connect to your postgres db and create a database named gamied
 - SET the password for user postgres to an environment variable: POSTGRES_PASSWORD
 - Create a virtual environment and execute the following within the virtual environment
```
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py runserver
```

 - With that, you should have the server running at http://127.0.0.1:8000
