FROM ubuntu:latest

WORKDIR /workspaces/GDM-Robotics

COPY . .

# Silence debconf messages
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update && \
    apt-get -y upgrade

RUN apt-get -y install build-essential git make curl

ARG CACHEBUST=1

RUN apt-get install -y wget \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3-Linux-x86_64.sh \
    -q -O /tmp/cmake-install.sh \
    && chmod u+x /tmp/cmake-install.sh \
    && mkdir /opt/cmake-3.26.3 \
    && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.26.3 \
    && rm /tmp/cmake-install.sh \
    && ln -s /opt/cmake-3.26.3/bin/* /usr/local/bin

COPY package.json .

RUN curl -sL https://deb.nodesource.com/setup_19.x | bash
RUN apt-get install -y nodejs
RUN npm install

CMD ["bash"]
