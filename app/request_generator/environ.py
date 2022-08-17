import environ
import os.path

env = environ.Env(
    DEBUG=(bool, True),
    ENVIRONMENT=str,
    MY_HOST=(str, 'localhost'),
    DOMAIN_NAME=(str, 'http://localhost:8000'),
    interpolate=True,
)


# Read .env file
BASE_DIR = environ.Path(__file__) - 3

LOCAL_ENV = BASE_DIR('.env.local')

if os.path.exists(LOCAL_ENV):
    environ.Env.read_env(LOCAL_ENV)

environ.Env.read_env(BASE_DIR(f".env.{env('ENVIRONMENT')}"))

__all__ = [
    env,
]

