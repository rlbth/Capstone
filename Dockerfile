FROM codenvy/python27:latest

WORKDIR /app
COPY . app.py /app/

RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
