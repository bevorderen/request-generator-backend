#FROM python:3.8-slim-buster AS development_build
FROM harbor.infotecs.int/dockerhub/library/python:3.9-slim-buster AS development_build
WORKDIR /code

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./app/pyproject.toml ./app/poetry.lock /code/
RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --no-dev


RUN groupadd -r web && useradd -d /code -r -g web web && chown web:web -R /code
# Running as non-root user:
USER web

COPY --chown=web:web app/ /code
RUN ENVIRONMENT=development python3 manage.py collectstatic --noinput