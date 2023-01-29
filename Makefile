help:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

conda-update:
	conda env update --prune -f environment.yml
	echo "!!!RUN RIGHT NOW:\nconda activate tenpo"

pip-tools:
	python -m pip install pip-tools
	pip-compile --find-links=https://download.pytorch.org/whl/torch_stable.html requirements/prod.in && pip-compile requirements/dev.in
	pip-sync requirements/prod.txt requirements/dev.txt

train:
	# python training/run_experiment.py --max_epochs=3 --gpus='1,' --data_class=CASIA --model_class=CNN
	python training/run_experiment.py

run:
	rm /storage/tmp/*
	python app.py

lint:
	tasks/lint.sh
