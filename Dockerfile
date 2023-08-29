#FROM ubuntu:22.04
FROM cruizba/ubuntu-dind

EXPOSE 8080

RUN apt-get update && \
    apt-get install curl -y

RUN curl -sSL -O https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz && \
    tar xvf /gotty_linux_amd64.tar.gz -C /bin && \
    rm -f /gotty_linux_amd64.tar.gz

RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

RUN curl -LO https://dl.k8s.io/release/v1.28.1/bin/linux/amd64/kubectl && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

ENV TERM=xterm-256color
RUN echo PS1="'"'\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '"'" >> /root/.bashrc

WORKDIR /root
COPY ./entrypoint.sh .

CMD ["/bin/bash", "/root/entrypoint.sh"]
