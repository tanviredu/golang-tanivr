files=$(shell find . -name '*.go' | grep -v hour14/example04/example04.go | grep -v hour14/example01.go)
all: check-gofmt vet 

check-gofmt:
	@if [ -n "$(shell gofmt -l ${files})" ]; then \
		echo 1>&2 'The following files need to be formatted:'; \
		gofmt -l .; \
		exit 1; \
	fi

vet:
	@go vet ./...

lint:
	@golint ./...
