FROM python:3
# Set application working directory
WORKDIR /usr/src/app
# Install requirements
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
# Install application
COPY replaceIP.py ./
COPY idtable.sql ./
COPY newid.php ./
# Run application
RUN apt-get update && apt-get install -y \
    apache2 \
    php
RUN mv newid.php /var/www/html
ENTRYPOINT [ "httpd", "-D", "FOREGROUND" ]
