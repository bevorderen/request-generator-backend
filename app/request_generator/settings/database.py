from request_generator.environ import env

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': env('POSTGRES_DB', default='r462'),
        'USER': env('POSTGRES_USER', default='r462'),
        'PASSWORD': env('POSTGRES_PASSWORD', default='111111'),
        'HOST': env('DATABASE_HOST', default='localhost'),
        'PORT': env('DATABASE_PORT', default='5432'),
    },
}

DEFAULT_AUTO_FIELD = 'django.db.models.AutoField'
