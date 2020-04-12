FROM python:2.7.17-slim-buster as python

FROM python as build
COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN mkdir -p dist/usr/local/lib/python2.7/site-packages
RUN cp -r /usr/local/lib/python2.7/site-packages dist/usr/local/lib/python2.7/
COPY read-id3-tags.py dist

FROM python
COPY --from=build dist /
ENTRYPOINT [ "./read-id3-tags.py" ]