FROM python:3.3

USER root

RUN yum -y install nss_wrapper gettext
# RUN pip install requests

# RUN adduser default
USER default
ADD ./ /opt/app-root/src/

WORKDIR /opt/app-root/src
USER root
RUN chgrp -R 0 /opt/app-root/src
RUN chmod -R g+rw /opt/app-root/src
RUN find /opt/app-root/src -type d -exec chmod g+x {} +
ENTRYPOINT [ "source",  "/opt/app-root/src/nss_wrapper.sh" ]
CMD [ "./run.sh" ]
