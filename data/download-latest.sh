#!/bin/sh
curl -o backyard-lion-`date +%F-%H%M%S`.dump `heroku pg:backups public-url --app backyard-lion`
