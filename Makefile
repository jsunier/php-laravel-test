REPOSITORY?=jsunier/php-laravel-test
ARM_DIRECTORY?=arm32
AMD_DIRECTORY?=amd64

build-amd:
	docker build $(AMD_DIRECTORY)/7.1/mysql -t $(REPOSITORY):7.1-mysql -t $(REPOSITORY):7.1-mariadb
	docker build $(AMD_DIRECTORY)/7.2/mysql -t $(REPOSITORY):7.2-mysql -t $(REPOSITORY):7.2-mariadb
	docker build $(AMD_DIRECTORY)/7.3/mysql -t $(REPOSITORY):7.3-mysql -t $(REPOSITORY):7.3-mariadb

build-arm:
	docker build $(ARM_DIRECTORY)/7.1/mysql -t $(REPOSITORY):7.1-mysql-arm32v7 -t $(REPOSITORY):7.1-mariadb-arm32v7
	docker build $(ARM_DIRECTORY)/7.2/mysql -t $(REPOSITORY):7.2-mysql-arm32v7 -t $(REPOSITORY):7.2-mariadb-arm32v7
	docker build $(ARM_DIRECTORY)/7.3/mysql -t $(REPOSITORY):7.3-mysql-arm32v7 -t $(REPOSITORY):7.3-mariadb-arm32v7

push-amd:
	docker push $(REPOSITORY):7.1-mysql
	docker push $(REPOSITORY):7.1-mariadb
	docker push $(REPOSITORY):7.2-mysql
	docker push $(REPOSITORY):7.2-mariadb
	docker push $(REPOSITORY):7.3-mysql
	docker push $(REPOSITORY):7.3-mariadb

push-arm:
	docker push $(REPOSITORY):7.1-mysql-arm32v7
	docker push $(REPOSITORY):7.1-mariadb-arm32v7
	docker push $(REPOSITORY):7.2-mysql-arm32v7
	docker push $(REPOSITORY):7.2-mariadb-arm32v7
	docker push $(REPOSITORY):7.3-mysql-arm32v7
	docker push $(REPOSITORY):7.3-mariadb-arm32v7

all: build-amd push-amd

.PHONY: all