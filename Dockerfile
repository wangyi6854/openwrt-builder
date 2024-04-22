FROM rockylinux:9

RUN dnf update -y

RUN dnf groupinstall -y "Development Tools"

RUN dnf install -y \
        bzip2 gcc gcc-c++ git make ncurses-devel patch \
        rsync tar unzip wget which diffutils python3 perl-base \
        perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin \
        perl-IPC-Cmd perl-JSON-PP perl-Thread-Queue perl-Time-Piece perl-XML-Parser

WORKDIR /home/user

COPY build.sh /home/user/

RUN git config --global user.name "user" && git config --global user.email "user@example.com"

RUN mkdir openwrt
