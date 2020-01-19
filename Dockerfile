FROM python:3.7-stretch AS base

RUN set -ex; \
  \
  pip install --upgrade pip \
  && pip install pipenv

WORKDIR /worker

# make Pipfile file
#RUN pipenv install numpy \
#    && pipenv install pytest \
#    && pipenv install autopep8 \
#    && pipenv install flake8 \
#    && pipenv install responder \
#    && pipenv install pandas \
#    && pipenv install cerberus

COPY ./Pipfile ./Pipfile.lock ./

RUN set -ex; \
  \
  pipenv install --system --deploy

EXPOSE 5042