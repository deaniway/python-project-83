PORT ?= 8000

install:
	poetry install

dev:
	 poetry run flask --app page_analyzer:app --debug run --port 8000


start:
	poetry run gunicorn -w 5 -b 0.0.0.0:$(PORT) page_analyzer:app

lint:
	poetry run flake8 page_analyzer

link_psql:
	docker exec -it dev_page_analyzer psql -U pguser -d pgdb psql
