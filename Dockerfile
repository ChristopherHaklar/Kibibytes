# FROM centos:latest
FROM ubuntu:latest
# Set application working directory
WORKDIR /usr/src/app
# Install requirements
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
# Install application
# RUN yum install -y httpd php php-mysqlnd
RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && apt install -y apache2 php libapache2-mod-php php-mysql
COPY replaceIP.py ./
COPY idtable.sql ./
COPY newid.php /var/www/html
EXPOSE 80
ENTRYPOINT [ "/usr/sbin/apache2ctl", "-D", "FOREGROUND" ]
