FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y sudo curl && \
    bash -c 'bash <(curl -s https://build-scripts.immortalwrt.org/init_build_environment.sh)' && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -m builder -s /bin/bash && \
    usermod -aG sudo builder && \
    echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/builder

CMD ["/bin/bash"]
