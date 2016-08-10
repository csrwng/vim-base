FROM fedora:24
RUN dnf -y install \
      rsync \
      git \
      wget \
      vim \
      langpacks-en \
      automake \
      python \
      python-devel \
      python3-devel \
      redhat-rpm-config \
      zlib-devel && \
    dnf -y groupinstall  \
      "C Development Tools and Libraries"
ENV HOME=/home/user \
    TERM=xterm-256color
RUN adduser -d ${HOME} -u 1001 default && \
    mkdir /code &&
    chmod 775 -R /home/user 
COPY vimrc ${HOME}/.vimrc
COPY gitconfig ${HOME}/.gitconfig
COPY gitignore_global ${HOME}/.gitignore_global
