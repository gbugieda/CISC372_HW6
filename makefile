#Gia Bugieda and Addison Kuykendall
CFLAGS=
all: fastblur cudablur2 cudablur3

fastblur: obj/fastblur.o
	gcc $(CFLAGS) obj/fastblur.o -o fastblur -lm

cudablur2: obj/cudablur2.o
	nvcc $(CFLAGS) obj/cudablur2.o -o cudablur2 -lm

cudablur3: obj/cudablur3.o
	nvcc $(CFLAGS) obj/cudablur3.o -o cudablur3 -lm

obj/fastblur.o: fastblur.c
	gcc -c $(CFLAGS) fastblur.c -o obj/fastblur.o 

obj/cudablur2.o: cudablur2.cu
	nvcc -c $(CFLAGS) cudablur2.cu -o obj/cudablur2.o 

obj/cudablur3.o: cudablur3.cu
	nvcc -c $(CFLAGS) cudablur3.cu -o obj/cudablur3.o 

clean:
	rm -f obj/* fastblur cudablur2 cudablur3 output.png
