FROM python:3.3

USER root

RUN yum -y install nss_wrapper gettext
# RUN pip install requests
ADD ./ /opt/app-root/src/

WORKDIR /opt/app-root/src

CMD [ "./run.sh" ]
