VERSION=$(shell grep __version__ hipyschool/__init__.py)
REQUIREMENTS="requirements-dev.pip"
TAG="\n\n\033[0;32m\#\#\# "
END=" \#\#\# \033[0m\n"

all: test

msg-init:
	@echo $(TAG)Initialising messages from Hi Pyschool$(END)
	- pybabel init -D hipyschool -i hipyschool/locale/hipyschool.pot -d hipyschool/locale -l en
	- pybabel init -D hipyschool -i hipyschool/locale/hipyschool.pot -d hipyschool/locale -l es
	@echo

msg-extract:
	@echo $(TAG)Extracting messages from Hi Pyschool$(END)
	- pybabel extract -o hipyschool/locale/hipyschool.pot hipyschool
	- pybabel update -D hipyschool -i hipyschool/locale/hipyschool.pot -d hipyschool/locale -l en
	- pybabel update -D hipyschool -i hipyschool/locale/hipyschool.pot -d hipyschool/locale -l es
	@echo

msg-compile:
	@echo $(TAG)Compiling messages to Hi Pyschool$(END)
	- pybabel compile -D hipyschool -d hipyschool/locale -f --statistics
	@echo

msg: msg-extract msg-compile

uninstall-hipyschool:
	@echo $(TAG)Removing existing installation of Hi Pyschool$(END)
	- pip uninstall --yes hipyschool >/dev/null
	@echo

uninstall-all: uninstall-hipyschool
	- pip uninstall --yes -r $(REQUIREMENTS)

init: uninstall-hipyschool
	@echo $(TAG)Installing dev requirements$(END)
	pip install --upgrade -r $(REQUIREMENTS)
	@echo $(TAG)Installing Hi Pyschool$(END)
	pip install --upgrade --editable .
	@echo

test: init
	@echo $(TAG)Running tests in on current Pyschool with coverage $(END)
	py.test --cov ./hipyschool --cov ./tests --doctest-modules --verbose ./hipyschool ./tests
	@echo

test-tox: init
	@echo $(TAG)Running tests on all Pyschools via Tox$(END)
	tox
	@echo

test-dist: test-sdist test-bdist-wheel
	@echo

test-sdist: clean uninstall-hipyschool
	@echo $(TAG)Testing sdist build an installation$(END)
	python setup.py sdist
	pip install --force-reinstall --upgrade dist/*.gz
	@echo

test-bdist-wheel: clean uninstall-hipyschool
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
