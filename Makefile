DOCKER_COMPOSE   = docker-compose
DOCKER           = docker

PROJECT_NAME     = sf4-project

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

start: ## Start the project | dev
	$(DOCKER_COMPOSE) up -d

stop: ## Stop all docker project containers
	-$(DOCKER_COMPOSE) stop

cli: ## Access docker cli
	$(DOCKER_COMPOSE) exec php-fpm bash

sf: ## Access symfony cli
	$(DOCKER_COMPOSE) exec php-fpm $(PROJECT_NAME)/bin/console

mysql: ## Access mysql cli
	$(DOCKER_COMPOSE) exec mysql mysql -uroot -pdbrootpw

