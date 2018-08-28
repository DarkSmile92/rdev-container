FROM rdev-base

RUN apt-get install php-patchwork-utf8 php7.0-mbstring php7.0-xml -y

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
RUN sed -i 's/ExecStart=\/usr\/sbin\/php-fpm7.0/ExecStart=\/usr\/sbin\/php-fpm7.0 --allow-to-run-as-root/' /etc/systemd/system/multi-user.target.wants/php7.0-fpm.service
RUN service php7.0-fpm start
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# create project directory, mount this to your local filesystem later
RUN mkdir -p /var/www/project

RUN chmod 757 /var/www
RUN chown -R www-data /var/www
# set /app as default working directory
WORKDIR /var/www/project

EXPOSE 80

CMD /etc/init.d/php7.0-fpm start; nginx;