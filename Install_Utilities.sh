# Prereqs and docker
sudo apt-get update &&
    sudo apt-get install -yqq \
        curl \
        git \
        apt-transport-https \
        ca-certificates \
        gnupg-agent \
        software-properties-common \
        net-tools \
        vim \
        nano \
        dnsutils \
        jq \
        firewalld \
        cron \
        python3-pip \
        python3
ln -s ~/Common-Ubuntu-Utility-scripts/update.sh ~/update.sh
