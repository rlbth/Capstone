FROM codenvy/python27

WORKDIR /app
COPY . app.py /app/
RUN sudo pip install --upgrade pip &&\    
    pip install -r requirements.txt
EXPOSE 5000
CMD ["python", "app.py"]
