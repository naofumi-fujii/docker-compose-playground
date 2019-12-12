build:
	stack build
run:
	PORT=8080 stack exec wai-sample
docker-build:
	docker pull matsubara0507/stack-build:lts-14.17 && stack --docker build -j 1 Cabal
