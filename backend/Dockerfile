FROM python:3.8
COPY ./backend /backend
COPY ./requirements/ /backend
WORKDIR /backend
RUN pip install -r prod.txt
ENTRYPOINT [ "python" ]
CMD ["app.py"]