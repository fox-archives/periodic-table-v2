# shellcheck shell=bash

task.init() {
	local version=
	version=$(node --version)
	
	[ "$version" = 'v8.17.0' ]
}

task.front() {
	cd './front'
	./node_modules/.bin/vue-cli-service serve
}

task.back() {
	cd './back'
	node app.js
}