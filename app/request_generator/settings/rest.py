REST_FRAMEWORK = {
    'DEFAULT_PARSER_CLASSES': (
        'rest_framework.parsers.JSONParser',
    ),

    'DEFAULT_RENDERER_CLASSES': (
        'rest_framework.renderers.JSONRenderer',
    ),

    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.TokenAuthentication',
        'rest_framework.authentication.BasicAuthentication',
    ),

    'DEFAULT_METADATA_CLASS': 'rest_framework.metadata.SimpleMetadata',

    'DATE_FORMAT': '%d-%m-%Y',
    'DATE_INPUT_FORMATS': ['%d-%m-%Y', '%Y-%m-%d', '%d.%m.%Y'],
}

AUTH_TOKEN_EXPIRED_DAYS = 30

# https://github.com/ottoyiu/django-cors-headers
CORS_ORIGIN_ALLOW_ALL = True
CORS_ALLOW_METHODS = (
    'GET',
    'POST',
    'PUT',
    'DELETE',
    'OPTIONS'
)
CORS_EXPOSE_HEADERS = ('Access-Control-Allow-Origin',)
CORS_ALLOW_CREDENTIALS = False
CORS_REPLACE_HTTPS_REFERER = False

LOGIN_URL = '/admin/login/'
LOGOUT_URL = '/admin/logout/'
