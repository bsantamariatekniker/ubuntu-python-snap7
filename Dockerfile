FROM ubuntu:20.04

# Install GnuPG, Python3 and pip
RUN apt-get update \
    && apt-get install -y gnupg python3 python3-pip

# Install snap7
RUN printf "deb http://ppa.launchpad.net/gijzelaar/snap7/ubuntu focal main\n" > /etc/apt/sources.list.d/snap7.list \
    && printf "deb-src http://ppa.launchpad.net/gijzelaar/snap7/ubuntu focal main\n" >> /etc/apt/sources.list.d/snap7.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CAFC44EE7F39098CE6EC229CCA70E6A9087475A0 \
    && apt-get update \
    && apt-get install -y libsnap7-dev libsnap7-1 \
    && pip3 install python-snap7

# Expose snap7 server port
EXPOSE 102/tcp
