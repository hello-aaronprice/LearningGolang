.PHONY: up down prune log

up:
	docker compose -p dev -f compose.yaml up --watch

down:
	docker compose -p dev down

prune:
	docker image prune -f
	docker container prune -f

log:
	docker compose logs -f -t
