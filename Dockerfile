FROM webdevops/php-apache:7.1
# Set application working directory
WORKDIR /usr/src/app
# Install requirements
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
# Install application
COPY replaceIP.py ./
COPY idtable.sql ./
COPY newid.php ./
# Run application
RUN mv newid.php /var/www/html
ENTRYPOINT [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
