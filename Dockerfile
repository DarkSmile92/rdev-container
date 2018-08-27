FROM node

# create app directory
RUN mkdir -p /app

# create ACE editor directory
RUN mkdir -p /ace

# set /ace as default working directory
WORKDIR /ace

ADD index.html /ace/

# install git
RUN apt-get install git -y

# clone ace
RUN git clone https://github.com/ajaxorg/ace.git /ace

RUN npm i

# install nginx
RUN apt-get update
RUN apt-get install nginx -y

# add config file
ADD nginx.site /etc/nginx/sites-available/default

RUN systemctl stop nginx
RUN systemctl start nginx


# set /app as default working directory
WORKDIR /app

EXPOSE 8888

