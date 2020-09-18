FROM jrottenberg/ffmpeg

ARG PYTHON_VERSION=3.8.5
ARG PYTHON_ROOT=/usr/local
ARG PYENV_ROOT=/tmp/.pyenv
ARG PYBUILD_ROOT=/tmp/python-build

RUN apt-get update -qq && apt-get upgrade -y \
  && apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    python-openssl \
    git \
  && git clone https://github.com/pyenv/pyenv.git $PYENV_ROOT \
  && PREFIX=$PYBUILD_ROOT $PYENV_ROOT/plugins/python-build/install.sh \
  && $PYBUILD_ROOT/bin/python-build -v $PYTHON_VERSION $PYTHON_ROOT \
  && rm -rf $PYBUILD_ROOT $PYENV_ROOT

ENTRYPOINT []
