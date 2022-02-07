FROM ubuntu:20.04
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -y && \
    apt install -y --no-install-recommends \
    curl \
    unzip \
    expect \
    sudo \
    python3-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools \
    git \
    cmake \
    libblas3 \
    libblas-dev && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv
ENV PATH="~/.tfenv/bin:$PATH"
RUN ["/bin/bash", "-c", "tfenv install 0.13.7"]
RUN ["/bin/bash", "-c", "tfenv install 0.15.5"]
RUN ["/bin/bash", "-c", "tfenv install 1.0.11"]
RUN ["/bin/bash", "-c", "tfenv use 0.15.5"]

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

COPY ./credentials.sh ./
RUN chmod 755 /credentials.sh
RUN ./credentials.sh
RUN rm ./credentials.sh


