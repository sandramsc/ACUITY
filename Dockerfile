# Dockerfile, Docker Image, Docker Container
FROM jupyter/scipy-notebook

COPY requirements.txt ./requirements.txt

COPY data/SnapChat_reviews.csv ./data/SnapChat_reviews.csv

COPY script.ipynb ./script.ipynb

RUN pip install -r requirements.txt

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0

ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini

RUN chmod +x /usr/bin/tini

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]