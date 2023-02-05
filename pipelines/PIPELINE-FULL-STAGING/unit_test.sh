#!/bin/bash

source todo-list-aws/bin/activate
set -x
export PYTHONPATH="${PYTHONPATH}:$(pwd)"
echo "PYTHONPATH: $PYTHONPATH"
export DYNAMODB_TABLE=todoUnitTestsTable
python test/unit/TestToDo.py
python test/integration/todoApiTest.py
pip show coverage
coverage run --include=src/todoList.py test/unit/TestToDo.py
coverage report -m
--cov-report term-missing
coverage xml
coverage html
