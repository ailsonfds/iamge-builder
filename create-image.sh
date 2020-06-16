#!/bin/bash

# Clone the required repositories. Some of these are also available
# via pypi or as distro packages.
# git clone https://opendev.org/openstack/tripleo-image-elements
# git clone https://opendev.org/openstack/heat-agents


# Install diskimage-builder on virtual enviroment
virtualenv dib-virtualenv
. dib-virtualenv/bin/activate
pip install diskimage-builder
# pip install git+https://opendev.org/openstack/diskimage-builder

# Required by diskimage-builder to discover element collections
# export ELEMENTS_PATH=tripleo-image-elements/elements:heat-agents/:elements/
export ELEMENTS_PATH=elements/

# The base operating system element(s) provided by the diskimage-builder
# elements collection. Other values which may work include:
# centos7, debian, opensuse, rhel, rhel7, or ubuntu
export BASE_ELEMENTS="debian-minimal"

# Disk Image build environment variables. A list with predefined elements can 
# be found at https://docs.openstack.org/diskimage-builder/latest/elements.html
export DIB_RELEASE="stretch"
export DIB_PYTHON_VERSION=3

# Install and configure the os-collect-config agent to poll the metadata
# server (heat service or zaqar message queue and so on) for configuration
# changes to execute
# export AGENT_ELEMENTS="os-collect-config os-refresh-config os-apply-config"
export AGENT_ELEMENTS="latest-docker"

# heat-config installs an os-refresh-config script which will invoke the
# appropriate hook to perform configuration. The element heat-config-script
# installs a hook to perform configuration with shell scripts
# export DEPLOYMENT_BASE_ELEMENTS="heat-config heat-config-script"

# The name of the qcow2 image to create, and the name of the image
# uploaded to the OpenStack image registry.
export IMAGE_NAME=image

# Create the image
# echo "To create the image, run the following"
# echo "    ELEMENTS_PATH=elements/ disk-image-create vm $BASE_ELEMENTS $AGENT_ELEMENTS \
#        $DEPLOYMENT_BASE_ELEMENTS $DEPLOYMENT_TOOL -o $IMAGE_NAME.qcow2"
disk-image-create vm $BASE_ELEMENTS $AGENT_ELEMENTS $DEPLOYMENT_BASE_ELEMENTS \
    $DEPLOYMENT_TOOL -o $IMAGE_NAME.qcow2 || exit 1

# Upload the image, assuming valid credentials are already sourced
# echo "To upload the image $IMAGE_NAME created on Openstack, run the following"
# echo "    openstack image create --disk-format qcow2 --container-format bare $IMAGE_NAME < $IMAGE_NAME.qcow2"
