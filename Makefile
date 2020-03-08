REPOSITORY=jsunier/php-laravel-test
ARM_DIRECTORY=arm32
AMD_DIRECTORY=amd64
PHP_VERSIONS=7.4 7.3 7.2 7.1
LATEST_VERSION=7.4

.PHONY: build-amd
build-amd:
	for VERSION in $(PHP_VERSIONS); do \
		docker build $(AMD_DIRECTORY)/$$VERSION/mysql -t $(REPOSITORY):$$VERSION-mysql -t $(REPOSITORY):$$VERSION-mariadb; \
	done
	docker build $(AMD_DIRECTORY)/$(LATEST_VERSION)/mysql -t $(REPOSITORY):latest-mysql -t $(REPOSITORY):latest-mariadb

.PHONY: build-arm
build-arm:
	for VERSION in $(PHP_VERSIONS); do \
		docker build $(ARM_DIRECTORY)/$$VERSION/mysql -t $(REPOSITORY):$$VERSION-mysql-arm32v7 -t $(REPOSITORY):$$VERSION-mariadb-arm32v7; \
	done
	docker build $(ARM_DIRECTORY)/$(LATEST_VERSION)/mysql -t $(REPOSITORY):latest-mysql-arm32v7 -t $(REPOSITORY):latest-mariadb-arm32v7

.PHONY: push-amd
push-amd:
	for VERSION in $(PHP_VERSIONS); do \
		docker push $(REPOSITORY):$$VERSION-mysql; \
		docker push $(REPOSITORY):$$VERSION-mariadb; \
	done
	docker push $(REPOSITORY):latest-mysql
	docker push $(REPOSITORY):latest-mariadb

.PHONY: push-arm
push-arm:
	for VERSION in $(PHP_VERSIONS); do \
		docker push $(REPOSITORY):$$VERSION-mysql-arm32v7; \
		docker push $(REPOSITORY):$$VERSION-mariadb-arm32v7; \
	done
	docker push $(REPOSITORY):latest-mysql-arm32v7
	docker push $(REPOSITORY):latest-mariadb-arm32v7

.PHONY: all
all: build-amd push-amd
