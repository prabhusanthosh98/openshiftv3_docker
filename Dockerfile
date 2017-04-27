FROM python:3.3

USER root

RUN yum -y install nss_wrapper gettext
# RUN pip install requests

# RUN adduser default
ADD ./ /opt/app-root/src/

WORKDIR /opt/app-root/src
RUN chgrp -R 0 /opt/app-root/src
RUN chmod -R g+rw /opt/app-root/src
RUN find /opt/app-root/src -type d -exec chmod g+x {} +
# ENTRYPOINT [ "source",  "/opt/app-root/src/nss_wrapper.sh" ]
RUN adduser 1001
USER 1001
ENTRYPOINT [ "/opt/app-root/src/nss_wrapper.sh" ]
# ENTRYPOINT export USER_ID=$(id -u)
CMD [ "./run.sh" ]
