#to download the base image
FROM python:3.9-slim

# create a working directoty 
WORKDIR /app

#copy everythink 
COPY . .

#run the command
RUN pip install -r requirement.txt

#to run the file
CMD ["python","run.py"]

