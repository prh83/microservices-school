lint:
	@node_modules/.bin/eslint .

qa:
	@make lint && npm run test

brand:
	@node_modules/make-manifest/bin/make-manifest --extra "build.url: https://travis-ci.org/feliun/microservices-school/builds/"$(TRAVIS_BUILD_ID) --extra "build.number: "$(TRAVIS_BUILD_NUMBER)
	@cat ./manifest.json
	
ensure-dependencies:
	@npm run docker

