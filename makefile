

all: loops recurcives loopd recursived mains maindloop maindrec

loops: libclassloop.a
libclassloop.a: basicClassification.o advancedClassificationLoop.o NumClass.h
	ar -rcs libclassloop.a basicClassification.o advancedClassificationLoop.o

recurcives: libclassrec.a
libclassrec.a: basicClassification.o advancedClassificationRecursion.o NumClass.h
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

recursived: libclassrec.so
libclassrec.so: basicClassification.o advancedClassificationRecursion.o NumClass.h
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationLoop.o -lm

loopd: libclassloops.so
libclassloops.so: basicClassification.o advancedClassificationLoop.o NumClass.h
	gcc -shared -o libclassloops.so basicClassification.o advancedClassificationRecursion.o -lm

mains: main.o libclassrec.a
	gcc -Wall -g -o mains main.o libclassrec.a -lm

maindloop: main.o libclassloops.so
	gcc -Wall -g -o maindloop main.o ./libclassloops.so -lm

maindrec: main.o libclassrec.so
	gcc -Wall -g -o maindrec main.o ./libclassrec.so -lm

mainsloop: libclassloop.a main.o
	gcc -Wall -g -o mainsloop main.o libclassloop.a -lm

main.o: main.c NumClass.h
	gcc -Wall -g -c main.c -lm

basicClassification.o: basicClassification.c NumClass.h
	gcc -Wall -g -c basicClassification.c -lm

advancedClassificationLoop.o: advancedClassificationLoop.c NumClass.h
	gcc -Wall -g -c advancedClassificationLoop.c -lm

advancedClassificationRecursion.o: advancedClassificationRecursion.c NumClass.h
	gcc -Wall -g -c advancedClassificationRecursion.c -lm




.PHONY: clean all

clean:
	rm -f *.o *.a *.so maindloop mains maindrec : 


