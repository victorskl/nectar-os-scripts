#!/usr/bin/env bash


ACTIVATE_SCRIPT=./.venv/bin/activate

if [ ! -f ${ACTIVATE_SCRIPT} ]; then
    echo "Python virtualenv .venv not found! Try 'bash install.sh'"
    exit 1
fi

source ${ACTIVATE_SCRIPT}

echo "Client Environment..."
which python
which openstack
echo ""

export OS_USERNAME=`cat .username`
export OS_PASSWORD=`cat .passwd`

export OS_AUTH_URL=https://keystone.rc.nectar.org.au:5000/v3/
export OS_AUTH_TYPE=password
export OS_REGION_NAME="Melbourne"
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi
export OS_INTERFACE=public
export OS_IDENTITY_API_VERSION=3
export OS_USER_DOMAIN_NAME="Default"
if [ -z "$OS_USER_DOMAIN_NAME" ]; then unset OS_USER_DOMAIN_NAME; fi
export OS_PROJECT_DOMAIN_NAME="Default"
if [ -z "$OS_PROJECT_DOMAIN_NAME" ]; then unset OS_PROJECT_DOMAIN_NAME; fi
