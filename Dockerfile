FROM rust:1.26.0-stretch

RUN apt-get update
RUN apt-get install -y build-essential libncurses5-dev gawk git subversion libssl-dev gettext unzip zlib1g-dev file python systemtap-sdt-dev python-pip rsync time

RUN pip install ansible ansible-lint

RUN ln -s /usr/local/cargo/ /root/.cargo

ARG DEVICE=omnia.yml
ENV DEVICE ${DEVICE}
ARG PROFILE=althea-dev.yml
ENV PROFILE ${PROFILE}

ADD . /althea-firmware
WORKDIR althea-firmware

RUN ansible-playbook first-time-setup.yml

RUN ansible-playbook -e @profiles/devices/$DEVICE -e @profiles/management/$PROFILE firmware-build.yml

