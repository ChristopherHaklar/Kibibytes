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
CMD [ "/bin/bash", "mv idtable.php /var/www/html" ]
# CMD python3 replaceIP.py
