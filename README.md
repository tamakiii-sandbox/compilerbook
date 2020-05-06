# compilerbook

- [低レイヤを知りたい人のためのCコンパイラ作成入門(by Rui Ueyama)](https://www.sigbus.info/compilerbook)

## How to use
~~~sh
make -f docker.mk help
make -f docker.mk install
make -f docker.mk build
docker run -it --rm -v $(pwd):/usr/local/app/compilerbook compilerbook bash
~~~

Update `Dockerfile`
~~~sh
make -B Dockerfile
~~~~
