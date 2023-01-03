FROM php:8.1-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    php-mysql

    

# Download and install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /www/html/

# Give full permissions to www/html/ directory
RUN chmod -R 777 /www/html/

# Run PHP server
CMD ["php", "-S", "0.0.0.0:80", "-t", "/www/html/"]
