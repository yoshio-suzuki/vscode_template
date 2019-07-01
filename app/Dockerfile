FROM python:3.7

VOLUME ["/root/code"]

RUN apt-get update && apt-get install -y screen less locales && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    locale-gen ja_JP.UTF-8 && localedef -f UTF-8 -i ja_JP ja_JP && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash && \
    pip install pipenv

ENV LANG=ja_JP.UTF-8
WORKDIR /root
COPY .screenrc .bashrc ./

ENTRYPOINT ["/bin/bash"]

