FROM python:3.8
WORKDIR /backend
COPY ./backend /backend
COPY ./requirements/ /backend
RUN pip install -r prod.txt
ENTRYPOINT [ "python" ]
CMD ["app.py"]