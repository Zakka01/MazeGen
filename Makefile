PYTHON=python3
RM=rm -rf
CONFIG=config.txt

install:
	@echo "Installing dependencies..."

run:
	@echo "Running a_maze_ing.py with config file..."
	$(PYTHON) a_maze_ing.py $(CONFIG)

debug:
	@echo "Running a_maze_ing.py in debug mode..."
	$(PYTHON) -m pdb a_maze_ing.py $(CONFIG)

clean:
	@echo "Cleaning Python cache files..."
	$(RM) __pycache__ .mypy_cache .pytest_cache

lint:
	@echo "Running flake8 and mypy..."
	flake8 .
	mypy . --warn-return-any --warn-unused-ignores --ignore-missing-imports --disallow-untyped-defs --check-untyped-defs

lint-strict:
	@echo "Running strict lint checks..."
	flake8 . --max-line-length=79
	mypy . --strict

.PHONY: install run debug clean lint lint-strict