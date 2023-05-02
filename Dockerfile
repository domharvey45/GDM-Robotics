FROM ubuntu:latest

WORKDIR /workspaces/GDM-Robotics

COPY . .

# Silence debconf messages
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Unminimize Ubuntu OS image to access full functions
RUN yes | unminimize

# Refresh and update system
RUN apt-get update && \
  apt-get -y upgrade

# Install desired packages
RUN apt-get -y install \
  build-essential \
  git \
  make \
  curl \
  man \
  locate \
  gcc-arm-none-eabi \
  libnewlib-arm-none-eabi

# Force cache refresh
ARG CACHEBUST=1

# Install cmake
RUN apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://github.com/Kitware/CMake/releases/download/v3.26.3/cmake-3.26.3-Linux-x86_64.sh \
  -q -O /tmp/cmake-install.sh \
  && chmod u+x /tmp/cmake-install.sh \
  && mkdir /opt/cmake-3.26.3 \
  && /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.26.3 \
  && rm /tmp/cmake-install.sh \
  && ln -s /opt/cmake-3.26.3/bin/* /usr/local/bin

# Install Node.JS
RUN curl -sL https://deb.nodesource.com/setup_19.x | bash
RUN apt-get install -y nodejs

# Install Node packages
RUN npm install

RUN cp /workspaces/GDM-Robotics/config/.bashrc -t ~

CMD ["bash"]
