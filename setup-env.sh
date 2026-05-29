#!/bin/bash
# Spacebar environment config
PASSWORD="changeme_in_postgres"
echo "DATABASE=postgres://spacebar:${PASSWORD}@127.0.0.1:5432/spacebar" > .env
echo "CONFIG_PATH=config.json" >> .env
echo "Done"
cat .env