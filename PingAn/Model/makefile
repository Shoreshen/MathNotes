SRC_C = $(wildcard ./*.c)
OBJ_C = $(patsubst %.c,%.o,$(SRC_C))
HOST = localhost
PORT = 5432
USER = postgres

dbg.so: CFLAGS = -m64 -g -o dbg.so -shared -fPIC -fvisibility=hidden
rls.so: CFLAGS = -m64 -o rls.so -shared -fPIC -fvisibility=hidden -O3 -s

dbg.so: $(SRC_C) head.h struct.h
	gcc $(CFLAGS) $(SRC_C)

rls.so: $(SRC_C) head.h struct.h
	gcc $(CFLAGS) $(SRC_C)

exptbl:
	objdump -T dbg.so

dumpdbg:
	objdump -D dbg.so >./dbo.so.s

dumprls:
	objdump -D rls.so >./rls.so.s

clean:
	-rm dbg.so dbo.so.s rls.so rls.so.s

pydbg:
	python trail.py rls.so

docker_make:
	docker run --rm --user "$$(id -u):$$(id -g)" -v `pwd`:/io quay.io/pypa/manylinux1_x86_64 sh -c "cd /io && make rls.so"

upload:
	psql -h $(HOST) -p $(PORT) -U $(USER) -f ./Upload.sql