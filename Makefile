.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	wificore-wallet-client.min.js

clean:
	rm wificore-wallet-client.js
	rm wificore-wallet-client.min.js

wificore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

wificore-wallet-client.min.js: wificore-wallet-client.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
