build:
	stack build
run:
	PORT=8080 stack exec wai-sample
docker-build:
	# docker pull matsubara0507/stack-build:lts-14.17 && stack --docker build -j 1 Cabal
	stack --local-bin-path=./bin --docker install
	docker build -t naofumi-fujii/wai-sample . --build-arg local_bin_path=./bin
docker-run:
	docker run --rm -p 8080:8080 naofumi-fujii/wai-sample
