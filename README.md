# sample-blog-django-py

# installation  
## initialization  (one-time)
```commandline
python -m venv <virtual-env-name>
```
  
## install lib (first-time & on update)
```commandline
source <virtual-env-name>/bin/activate

# if you want come out of env you need to type  
deactivate

pip install -r requirements.txt
```

## run (virtual env initialized)
```commandline
python manage.py runserver
```