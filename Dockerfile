FROM python:3.12-slim

WORKDIR /usr

COPY pyproject.toml poetry.lock ./

RUN python -m pip install setuptools poetry

RUN poetry config virtualenvs.create false

RUN poetry install

COPY ./ ./

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]