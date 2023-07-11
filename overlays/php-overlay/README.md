# PHP Overlay

Unofficial PHP Overlay for Gentoo Linux

## Install

Install using Eselect Repository:

    eselect repository enable php-overlay

Install using Layman:

    layman -a php-overlay

## Composer

To install Composer you may want to add the following lines to `/etc/portage/package.accept_keywords/composer`:

```
# Composer
dev-php/class-map-generator
dev-php/composer
dev-php/pcre
dev-php/phar-utils
dev-php/signal-handler
dev-php/symfony-console
dev-php/symfony-deprecation-contracts
dev-php/symfony-filesystem
dev-php/symfony-finder
dev-php/symfony-polyfill-ctype
dev-php/symfony-polyfill-intl-grapheme
dev-php/symfony-polyfill-intl-normalizer
dev-php/symfony-polyfill-mbstring
dev-php/symfony-polyfill-php80
dev-php/symfony-polyfill-php81
dev-php/symfony-process
dev-php/symfony-service-contracts
dev-php/symfony-string
```
