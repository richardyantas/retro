1.- Development settings:

* Create a conda environment

```shell
make conda-update
```

* Build a development mlops image.

```bash

docker build -t mlops .

```

* Build a mlops container.

```bash
docker run -p 8080:8080 -p 50000:50000 -v /home/serendipita/mlops:/var/jenkins_home --name mlops mlops
```

2.- Jenkins pipeline:

- Get into Jenkins typing on browser `localhost:8080`.
- Create a Jenkins item.
- Get Google cloud credentials file and link it to Jenkins.
- Copy the jenkinsfile to configurations sections.
- Execute on build option to run pipeline.
