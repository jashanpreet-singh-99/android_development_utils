FROM ubuntu:14.04
ARG userid
ARG groupid
RUN apt-get update && apt-get install -y git-core schedtool bc gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip python openjdk-7-jdk
RUN curl -o jdk8.tgz https://android.googlesource.com/platform/prebuilts/jdk/jdk8/+archive/master.tar.gz \
 && tar -zxf jdk8.tgz linux-x86 \
 && mv linux-x86 /usr/lib/jvm/java-8-openjdk-amd64 \
 && rm -rf jdk8.tgz
RUN curl -o /usr/local/bin/repo https://storage.googleapis.com/git-repo-downloads/repo \
 && chmod a+x /usr/local/bin/repo
RUN groupadd -g $groupid jashan \
 && useradd -m -u $userid -g $groupid jashan \
 && echo jashan >/root/username \
 && echo "[user]" >>/home/jashan/.gitconfig
 && echo "	name = Jashanpreet Singh" >>/home/jashan/.gitconfig
 && echo "	email = jashan.singh.work@icloud.com" >>/home/jashan/.gitconfig
ENV HOME=/home/jashan
ENV USER=jashan
ENTRYPOINT chroot --userspec=$(cat /root/username):$(cat /root/username) / /bin/bash -i
