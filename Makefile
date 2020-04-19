.PHONY: build run

build:
	docker build -t ahsan.io $(PWD)

run: build
	docker stop ahsan.io || true
	docker rm ahsan.io || true
	docker run -dp 4000:4000 --name ahsan.io -v $(PWD):/srv/jekyll ahsan.io:latest