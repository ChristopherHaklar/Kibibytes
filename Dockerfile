FROM centos:latest
# Set application working directory
WORKDIR /usr/src/app
# Install requirements
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
# Install application
RUN yum install -y httpd php
EXPOSE 443
COPY replaceIP.py ./
COPY idtable.sql ./
COPY newid.php /var/www/html
ENTRYPOINT [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
