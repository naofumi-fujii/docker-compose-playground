docker run -it --rm --name my-running-script -v "$PWD":/usr/src/myapp -w /usr/src/myapp ruby:2.6-alpine ruby -e 'puts "hello world"'
