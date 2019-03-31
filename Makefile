
deps:
	pip install -r test_requirements.txt ; \
	pip install -r requirements.txt ;


lint:
	flake8 hello_world test

.PHONY: test

test:
	PYTHONPATH=. py.test  --verbose -s

docker_build:
	docker build -t hello-world-printer .


docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=. --cov-report xml

test_xunit:
	PYTHONPATH=. py.test -s --verbose --cov-report xml --junit-xml=test_results.xml

