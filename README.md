# compilerbook

- [低レイヤを知りたい人のためのCコンパイラ作成入門(by Rui Ueyama)](https://www.sigbus.info/compilerbook)

## How to use
~~~sh
make -f docker.mk help
make -f docker.mk install
# edit `.env` as you like
make -f docker.mk build
docker-compose run --rm compilerbook bash
~~~

Update `Dockerfile`
~~~sh
make -B Dockerfile
~~~~
