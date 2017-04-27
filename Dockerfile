FROM python:3.3

# RUN pip install requests

CMD [ "python", "-m", "http.server", "8000" ]
