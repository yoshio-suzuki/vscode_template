FROM python:3.7

VOLUME ["/root/code"]

RUN apt-get update && apt-get install -y \
      screen \
      vim \
      less \
      locales \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=ja_JP.UTF-8 \
    && curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash \
    && pip install pipenv

WORKDIR /root
COPY .screenrc .vimrc .bashrc ./

ENTRYPOINT ["/bin/bash"]

