IMAGE=sillycat.starter.fastapi
TAG=latest
NAME=sillycat.starter.fastapi
REPOSITORY=docker.io
STAGE=stage

push:
		docker push  $(REPOSITORY)/$(IMAGE):$(TAG)

docker-context:

build: docker-context
		docker build --tag $(REPOSITORY)/$(IMAGE):$(TAG) --build-arg STAGE=${STAGE} .

run:
		docker run -d -p 8000:8000 -v $(shell echo ${HOME})/.aws:/root/.aws -e RUNNING_ENV=dev --name $(NAME) $(REPOSITORY)/$(IMAGE):$(TAG)

clean:
		docker stop $(NAME)
		docker rm $(NAME)

log:
		docker logs -t -f $(NAME)