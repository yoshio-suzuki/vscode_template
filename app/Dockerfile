FROM python:3.7

VOLUME ["/root/code"]

RUN apt-get update && apt-get install -y screen less && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash && \
    pip install pipenv

WORKDIR /root
COPY .screenrc .bashrc ./

ENTRYPOINT ["/bin/bash"]

