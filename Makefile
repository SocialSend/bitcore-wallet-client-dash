.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	socialsendcore-wallet-client.min.js

clean:
	rm socialsendcore-wallet-client.js
	rm socialsendcore-wallet-client.min.js

socialsendcore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

socialsendcore-wallet-client.min.js: socialsendcore-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
