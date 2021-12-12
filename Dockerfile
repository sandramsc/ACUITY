# Dockerfile, Docker Image, Docker Container
FROM jupyter/scipy-notebook

COPY requirements.txt ./requirements.txt

COPY data/SnapChat_reviews.csv ./data/SnapChat_reviews.csv

COPY script.ipynb ./script.ipynb

RUN pip install -r requirements.txt
