FROM python:3.8
COPY ./backend /backend
COPY ./requirements/prod.txt /backend/prod.txt
WORKDIR /backend
RUN pip install -r prod.txt
ENTRYPOINT [ "python" ]
CMD ["app.py"]