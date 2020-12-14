# FROM centos:latest
FROM ubuntu:latest
# Set application working directory
WORKDIR /usr/src/app
# Install requirements
# COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
# Install application
# RUN yum install -y httpd php php-mysqlnd
RUN apt update && apt install -y apache2 php libapache2-mod-php php-mcrypt php-mysql
EXPOSE 443
COPY httpd.conf /etc/httpd/conf
COPY replaceIP.py ./
COPY idtable.sql ./
COPY newid.php /var/www/html
ENTRYPOINT [ "/usr/sbin/httpd", "-D", "FOREGROUND" ]
