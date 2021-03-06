FROM python:3.7-stretch AS base

RUN set -ex; \
  \
  pip install --upgrade pip \
  && pip install pipenv

WORKDIR /src

# make Pipfile
#RUN pipenv install numpy \
#    && pipenv install pytest \
#    && pipenv install autopep8 \
#    && pipenv install flake8 \
#    && pipenv install responder \
#    && pipenv install pandas \
#    && pipenv install cerberus

# install library
COPY ./src/Pipfile ./src/Pipfile.lock ./

RUN set -ex; \
  \
  pipenv install --system --deploy

# copy app file
COPY ./src/app.py ./

# copy test file
COPY ./tests/ ./tests

EXPOSE 5042

CMD ["python", "-u", "app.py"]