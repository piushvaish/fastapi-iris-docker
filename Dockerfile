FROM python:3.7.0

#virtualenv
ENV VIRTUAL_ENV=/opt/venv 
RUN python3 -m venv ${VIRTUAL_ENV}
ENV PATH="${VIRTUAL_ENV}/bin:$PATH" 

# add and install requirements
RUN pip3 install --upgrade pip
COPY ./requirements.txt .
RUN pip3 install -r requirements.txt 

# path
ENV PATH="/opt/venv/bin:${PATH}"
EXPOSE 80

COPY ./app app
VOLUME /app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]