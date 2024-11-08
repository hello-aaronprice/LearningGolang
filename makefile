dev:
	docker compose -p dev -f compose.yaml up --watch --build

dev-down:
	docke compose -p dev down
