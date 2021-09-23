IMAGE_REGISTRY = mailtokun/yutu-vue-example
IMAGE_TAG = $(shell git log -1 --pretty=%h)
clean:
	docker stop yutu-vue-example || true
	docker rm yutu-vue-example -f || true
build:
	yarn install
	yarn build
	docker build -t $(IMAGE_REGISTRY):$(IMAGE_TAG) .
run: clean
	docker run -d --name=yutu-vue-example --restart=always -p 127.0.0.1:1338:80 $(IMAGE_REGISTRY):$(IMAGE_TAG)
