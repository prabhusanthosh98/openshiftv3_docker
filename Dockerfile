FROM python:3.4

USER root

RUN yum -y install nss_wrapper gettext
# RUN pip install requests

# RUN adduser default
ADD ./ /opt/app-root/src/

WORKDIR /opt/app-root/src

# RUN pip install --upgrade pip

# RUN pip install requests
# RUN /bin/bash -c "pip install -r requirements.txt"

RUN chgrp -R 0 /opt/app-root/src
RUN chmod -R g+rw /opt/app-root/src
RUN find /opt/app-root/src -type d -exec chmod g+x {} +
# ENTRYPOINT [ "source",  "/opt/app-root/src/nss_wrapper.sh" ]
ENTRYPOINT [ "/opt/app-root/src/nss_wrapper.sh" ]
# ENTRYPOINT export USER_ID=$(id -u)
CMD [ "/opt/app-root/src/run.sh" ]
