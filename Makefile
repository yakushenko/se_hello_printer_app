
deps:
	pip install -r test_requirements.txt ; \
	pip install -r requirements.txt ;


lint:
	flake8 hello_world test

.PHONY: test

test:
	PYTHONPATH=. py.test  --verbose -s
