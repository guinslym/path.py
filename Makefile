setup:
	pip install -e .
	pip install -r dev_requirements.txt
	@echo "Setup completed"

requirements:
	@echo "Installing the dev_requirements"
	pip install -r dev_requirements.txt
	@echo "Requirements installed"

ci: test lint typing
	@echo "CI complete"

lint:
	@echo "Running pylint"
	@pylint path.py --msg-template="{path}:{line}:{column} {msg_id}({symbol}) {msg}"

test:
	@echo "Running pytest"
	@py.test tests

typing:
	@echo "Running mypy"
	@mypy path.py --ignore-missing-imports
