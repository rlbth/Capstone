FROM lakran21/mypython:0.0.1

WORKDIR /app
COPY . app.py /app/

RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python2", "app.py"]
