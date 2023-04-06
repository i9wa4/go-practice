.DEFAULT_GOAL := build

.PHONY: fmt
fmt:
	go fmt

# .PHONY: lint
# lint: fmt
# 	staticcheck

.PHONY: vet
vet: fmt
	go vet

.PHONY: build
build: vet
	# 必要なサードパーティーのライブラリのダウンロードや不要になったファイルの削除を行ってくれる
	go mod tidy
	go build -o go-practice.out

.PHONY: setup
setup:
	# add ~/go/bin to $PATH
	sudo add-apt-repository -y ppa:longsleep/golang-backports
	sudo apt update
	sudo apt install -y golang-go
	# go install honnef.co/go/tools/cmd/staticcheck@latest
