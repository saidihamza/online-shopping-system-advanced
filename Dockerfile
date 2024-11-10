# Utilisation de l'image officielle PHP avec Apache
FROM php:8.2-apache

# Installation des dépendances nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    git \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-install mysqli # Ajout de mysqli

# Activation du module Apache mod_rewrite pour les URL réécrites
RUN a2enmod rewrite

# Copier le code source de l'application dans le répertoire d'Apache
COPY ./src /var/www/html/

# Configurer les permissions du répertoire
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 80
EXPOSE 80

# Commande pour démarrer Apache
CMD ["apache2-foreground"]
