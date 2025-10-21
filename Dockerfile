#-----------------stage 1---------------------
#to download the base image
FROM python:3.9 AS builder

# create a working directory 
WORKDIR /app

#update teh system
RUN apt-get update

# copy only requirement 

COPY requirement.txt .

#download the dependency 

RUN pip install --no-cache-dir -r requirement.txt

#---------------stage 2 ----------------------
FROM python:3.9-slim

RUN apt-get update

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
COPY . .
CMD ["python","run.py"]
   
