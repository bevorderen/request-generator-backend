import os


os.environ['DJANGO_SETTINGS_MODULE'] = 'request_generator.settings'
os.environ.setdefault('ENVIRONMENT', 'development')

from django.conf import settings


print(f"Loaded configuration for {settings.ENVIRONMENT} ENVIRONMENT.")

