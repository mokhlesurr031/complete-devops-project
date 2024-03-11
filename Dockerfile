FROM python:3.11-alpine

WORKDIR /app

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev 

RUN pip install --upgrade pip 


# set env variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# install dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "core.wsgi:application"]