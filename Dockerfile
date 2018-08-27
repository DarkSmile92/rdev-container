FROM rdev-base

# install git
RUN apt-get install git -y

# clone ace
#RUN git clone https://github.com/ajaxorg/ace.git /ace
RUN git clone https://github.com/mattpass/ICEcoder.git /var/www/ice

# set /ace as default working directory
WORKDIR /var/www

# add config file
ADD default /etc/nginx/sites-available/
ADD info.php /var/www

RUN service nginx stop
RUN service nginx start
RUN nginx -t
RUN service php7.0-fpm start

# create project directory, mount this to your local filesystem later
RUN mkdir -p /var/www/project

RUN chown -R www-data /var/www/ice
# set /app as default working directory
WORKDIR /var/www/project

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]