lint:
	@node_modules/.bin/eslint .

qa:
	@docker run --name $(SERVICE) --env SERVICE_ENV=build --rm --network=local --entrypoint npm $(SERVICE):$(TRAVIS_BUILD_NUMBER) run qa --

brand:
	@node_modules/make-manifest/bin/make-manifest --extra "build.url: https://travis-ci.org/prh83/microservices-school/builds/"$(TRAVIS_BUILD_ID) --extra "build.number: "$(TRAVIS_BUILD_NUMBER)
	@cat ./manifest.json

ensure-dependencies:
	@npm run docker

package:
	@docker login -u=$(DOCKER_USERNAME) -p=$(DOCKER_PASSWORD) quay.io
	@docker build --tag recipes-api:1 .
	@docker images