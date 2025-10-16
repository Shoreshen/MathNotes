server:
	gcc -g -m64 -o ./Server/run ./Server/*.c -lpthread

servrun:
	./Server/run

clean:
	-rm ./Server/*.o ./Server/*.out ./Server/*.elf ./Server/*.so ./Server/run

elfdbg:
	gcc -g -m64 -o test.elf *.c

ncconn:
	nc 127.0.0.1 6666