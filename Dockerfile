FROM cimg/base:2020.01

#RUN apt update -y 
#RUN apt upgrade -y
RUN apt install -y git
RUN export DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt install -y apache2
RUN apt install -y php
RUN apt install -y mcrypt
RUN apt install -y php-mysqli
RUN apt install -y php-gd
RUN apt install -y php-xml
RUN apt install -y php-zip
RUN apt install -y mysql-server
RUN apt install -y mysql-client
RUN service mysql start
RUN /bin/bash -c "/usr/sbin/mysqld &" && \
  sleep 5 && \
  mysql -u root -e "CREATE DATABASE lms" && \
  mysql -u root -e "CREATE USER 'fdajek'@'localhost' IDENTIFIED BY 'hzerg734';" && \
  mysql -u root  -e "GRANT all ON *.* TO 'fdajek'@'localhost';"
RUN sleep 20
RUN rm -rf /var/www/html
RUN git clone https://github.com/fdajek/jorani.git  /var/www/html/
RUN apt remove --purge git
