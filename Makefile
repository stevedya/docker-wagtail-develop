build: ## Build the backend Docker image
	docker-compose build web

up: ## Bring the backend Docker container up
	docker-compose up

down: ## Stop the backend Docker container
	docker-compose stop

ssh: ## Enter the running backend Docker container for the wagtail bakery site
	docker-compose exec web bash

ssh-shell: ## Enter the running Docker container shell
	docker-compose exec web python manage.py shell

ssh-fe: ## Open a shell to work with the frontend code (Node/NPM)
	docker-compose exec frontend bash

ssh-wagtail: ## Enter the running Docker container for the wagtail development environment
	docker-compose exec -w /code/wagtail web bash

ssh-db: ## Open a PostgreSQL shell session
	docker-compose exec web python manage.py dbshell

clean: ## Stop and remove all Docker containers
	docker-compose down

migrations: ## Make migrations to the wagtail bakery site
	docker-compose exec web python manage.py makemigrations

migrate: ## Migrate the wagtail bakery site migrations
	docker-compose exec web python manage.py migrate

test: ## Run all wagtail tests or pass in a file with `make test file=wagtail.admin.tests.test_name.py`
	docker-compose exec -w /code/wagtail web python runtests.py $(FILE)
