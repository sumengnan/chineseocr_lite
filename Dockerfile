FROM centos:7

ENV LANG C.UTF-8 LC_ALL=C.UTF-8

COPY . /data/project/

WORKDIR /data/project/

RUN  yum -y install python3-pip libSM-1.2.2-2.el7.x86_64 libXrender libXext  \
    && pip3 install --user  -U pip -i https://pypi.tuna.tsinghua.edu.cn/simple/  \
    && pip3 config set global.index-url https://mirrors.aliyun.com/pypi/simple/ \
    && pip3 install -r requirements.txt

EXPOSE 8089

CMD python3 backend/main.py