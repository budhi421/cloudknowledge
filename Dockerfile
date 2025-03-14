FROM ubuntu:22.04
MAINTAINER budhiramsahani421@gmail.com

# Install Apache2, wget, zip, and unzip
RUN apt update && apt install -y apache2 wget zip unzip && rm -rf /var/lib/apt/lists/*
# Set ServerName to suppress the warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

WORKDIR /var/www/html

# Download the template inside the container
RUN wget -O little-fashion.zip "https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip" && \
    unzip little-fashion.zip && \
    cp -rvf 2127_little_fashion/* . && \
    rm -rf 2127_little_fashion little-fashion.zip

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
