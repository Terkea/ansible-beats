default: build

SHELL:=/bin/bash -eux
PATTERN := standard-ubuntu-2204

.PHONY: converge verify test login destroy list

setup:
	bundle install

converge: setup
	bundle exec kitchen converge $(PATTERN)

verify: setup
	bundle exec kitchen verify $(PATTERN)

test:
	bundle exec kitchen test $(PATTERN) --destroy=always

login:
	bundle exec kitchen login $(PATTERN)

destroy:
	bundle exec kitchen destroy $(PATTERN)

destroy-all:
	bundle exec kitchen destroy

list:
	bundle exec kitchen list
