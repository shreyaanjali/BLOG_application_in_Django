
FROM python:3.8

RUN apt-get update \ 
    && apt-get install -y --no-install-recommends \
    && apt-get install python3.8-dev \
    && pip install mysqlclient \
    && rm -rf /var/lib/apy/lists/*


WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8001
CMD ["python", "manage.py","runserver","0.0.0.0:8001"]

