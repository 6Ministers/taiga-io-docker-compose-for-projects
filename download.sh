#!/bin/bash

DESTINATION=$1

# clone Flectra directory
git clone --depth=1 https://github.com/6Ministers/taiga-io-docker-compose-for-projects $DESTINATION
rm -rf $DESTINATION/.git


