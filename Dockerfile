FROM cimg/base:2020.01

#RUN apt update -y 
#RUN apt upgrade -y
RUN sudo apt install -y git
RUN export DEBIAN_FRONTEND=noninteractive
RUN sudo ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN sudo apt-get install -y tzdata
RUN sudo dpkg-reconfigure --frontend noninteractive tzdata
RUN sudo apt install -y apache2
RUN sudo apt install -y php
RUN sudo apt install -y mcrypt
RUN sudo apt install -y php-mysqli
RUN sudo apt install -y php-gd
RUN sudo apt install -y php-xml
RUN sudo apt install -y php-zip
RUN sudo apt install -y mysql-server
RUN sudo apt install -y mysql-client
RUN sudo service mysql start
RUN sudo /bin/bash -c "/usr/sbin/mysqld &" && \
  sleep 5 && \
  mysql -u root -e "CREATE DATABASE lms" && \
  mysql -u root -e "CREATE USER 'fdajek'@'localhost' IDENTIFIED BY 'hzerg734';" && \
  mysql -u root  -e "GRANT all ON *.* TO 'fdajek'@'localhost';"
RUN sudo sleep 20
RUN sudo rm -rf /var/www/html
RUN sudo git clone https://github.com/fdajek/jorani.git  /var/www/html/
RUN sudo apt remove --purge git
