lint:
	# See local hadolint install instructions: https://github.com/hadolint/hadolint
	# This is a linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint3 --disable=R,C,W1203 app.py

build:
	docker build -t goldin2008/udacity-devops-capstone .

upload:
	docker push goldin2008/udacity-devops-capstone:latest