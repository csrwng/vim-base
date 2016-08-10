FROM fedora:24
LABEL src=https://github.com/csrwng/vim-base.git
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
    TERM=xterm-256color \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    GIT_PROMPT_ONLY_IN_REPO=1
RUN adduser -d ${HOME} -u 1001 default && \
    mkdir /code && \
    chmod 775 -R /home/user && \
    git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1 && \
    echo "source ~/.bash-git-prompt/gitprompt.sh" >> ${HOME}/.bashrc
COPY gitconfig ${HOME}/.gitconfig
COPY gitignore_global ${HOME}/.gitignore_global
