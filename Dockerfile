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
CMD [ "/bin/sh", "apt update && apt install apache2 -y && mv idtable.php /var/www/html" ]
# CMD python3 replaceIP.py
