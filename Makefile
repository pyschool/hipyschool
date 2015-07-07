VERSION=$(shell grep __version__ hipython/__init__.py)
REQUIREMENTS="requirements-dev.pip"
TAG="\n\n\033[0;32m\#\#\# "
END=" \#\#\# \033[0m\n"

all: test

msg-init:
	@echo $(TAG)Initialising messages from Hi Python$(END)
	- pybabel init -D hipython -i hipython/locale/hipython.pot -d hipython/locale -l en
	- pybabel init -D hipython -i hipython/locale/hipython.pot -d hipython/locale -l es
	@echo

msg-extract:
	@echo $(TAG)Extracting messages from Hi Python$(END)
	- pybabel extract -o hipython/locale/hipython.pot hipython
	- pybabel update -D hipython -i hipython/locale/hipython.pot -d hipython/locale -l en
	- pybabel update -D hipython -i hipython/locale/hipython.pot -d hipython/locale -l es
	@echo

msg-compile:
	@echo $(TAG)Compiling messages to Hi Python$(END)
	- pybabel compile -D hipython -d hipython/locale -f --statistics
	@echo

msg: msg-extract msg-compile

uninstall-hipython:
	@echo $(TAG)Removing existing installation of Hi Python$(END)
	- pip uninstall --yes hipython >/dev/null
	@echo

uninstall-all: uninstall-hipython
	- pip uninstall --yes -r $(REQUIREMENTS)

init: uninstall-hipython
	@echo $(TAG)Installing dev requirements$(END)
	pip install --upgrade -r $(REQUIREMENTS)
	@echo $(TAG)Installing Hi Python$(END)
	pip install --upgrade --editable .
	@echo

test: init
	@echo $(TAG)Running tests in on current Python with coverage $(END)
	py.test --cov ./hipython --cov ./tests --doctest-modules --verbose ./hipython ./tests
	@echo

test-tox: init
	@echo $(TAG)Running tests on all Pythons via Tox$(END)
	tox
	@echo

test-dist: test-sdist test-bdist-wheel
	@echo

test-sdist: clean uninstall-hipython
	@echo $(TAG)Testing sdist build an installation$(END)
	python setup.py sdist
	pip install --force-reinstall --upgrade dist/*.gz
	@echo

test-bdist-wheel: clean uninstall-hipython
	@echo $(TAG)Testing wheel build an installation$(END)
	python setup.py bdist_wheel
	pip install --force-reinstall --upgrade dist/*.whl
	@echo

# This tests everything, even this Makefile.
test-all: uninstall-all clean init test test-tox test-dist

publish: test-all
	@echo $(TAG)Testing wheel build an installation$(END)
	@echo "$(VERSION)"
	@echo "$(VERSION)" | grep -q "dev"  && echo "!!!Not publishing dev version!!!" && exit 1
	python setup.py register
	python setup.py sdist upload
	python setup.py bdist_wheel upload
	@echo

clean:
	@echo $(TAG)Cleaning up$(END)
	rm -rf .tox *.egg dist build .coverage
	find . -name '__pycache__' -delete -print -o -name '*.pyc' -delete -print
	@echo
