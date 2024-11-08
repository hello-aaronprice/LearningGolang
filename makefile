dev:
	docker compose -p dev -f compose.yaml up --watch --build

dev-down:
	docker compose -p dev down
