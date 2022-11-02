FROM library/ubuntu:20.04

RUN apt-get update

RUN apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime

RUN apt-get install -y locales
RUN locale-gen zh_TW.UTF-8
RUN update-locale
RUN echo 'export LANGUAGE="zh_TW.UTF-8"' >> /root/.bashrc
RUN echo 'export LANG="zh_TW.UTF-8"' >> /root/.bashrc
RUN echo 'export LC_ALL="zh_TW.UTF-8"' >> /root/.bashrc

ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8
ENV TZ Asia/Taipei

RUN apt-get update
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y gzip
RUN apt install -y unzip

# ttf-mscorefonts-installer安裝
RUN apt update
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt install -y ttf-mscorefonts-installer

#安裝字型
RUN apt install -y fontconfig
RUN fc-cache -f -v
RUN cd /usr/share/fonts/truetype
#全字庫正楷體
RUN wget https://cpchou0701.diskstation.me/fonts/TW-Kai-98_1.ttf
#全字庫宋體
RUN wget https://cpchou0701.diskstation.me/fonts/TW-Sung-98_1.ttf
RUN mv *.ttf /usr/share/fonts/truetype
RUN fc-cache -f -v

RUN apt-get install -y git
RUN apt install -y net-tools
RUN apt install -y telnet
#RUN apt-get install -y openssh-server
