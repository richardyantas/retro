FROM python:3.8.16-bullseye
# Create the working directory
RUN set -ex && mkdir /app
WORKDIR /app
COPY backend/ .
COPY doubleit_model.pt .
COPY requirements/prod.txt .
RUN pip install -r prod.txt
ENTRYPOINT [ "python3" ]
CMD ["app.py"]

# Run the web server
# EXPOSE 8000
# ENV PYTHONPATH /repo
# CMD python3 /repo/api/app.py
