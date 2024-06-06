# Prereqs and docker
sudo apt-get update &&
    sudo apt-get install -yqq \
        curl \
        git \
        apt-transport-https \
        ca-certificates \
        gnupg-agent \
        cifs-utils \
        nfs-common \
        software-properties-common \
        net-tools \
        vim \
        nano \
        dnsutils \
        jq \
        cron \
        python3-pip \
        python3
ln -s -f ~/Common-Ubuntu-Utility-scripts/update.sh ~/update.sh
