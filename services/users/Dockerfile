# base image
FROM python:3.7.2-alpine

# install dependencies
RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev && \
    apk add --no-cache g++ gcc libffi-dev musl-dev && \
    apk add netcat-openbsd

# set working directory
WORKDIR /usr/src/app

# add and install requirements
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# add entrypoint.sh
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh
COPY init_db.py /usr/src/app/init_db.py
RUN chmod +x /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/init_db.py
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

EXPOSE 5000

# add app
COPY . /usr/src/app

# run server
CMD ["/usr/src/app/entrypoint.sh"]
