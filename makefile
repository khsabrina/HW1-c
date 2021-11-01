

all: loops recurcives loopd recursived mains maindloop maindrec

loops: basicClassification.o advancedClassificationLoop.o NumClass.h
	ar -rcs libclassloop.a basicClassification.o advancedClassificationLoop.o

recurcives: basicClassification.o advancedClassificationRecursion.o NumClass.h
	ar -rcs libclassrec.a basicClassification.o advancedClassificationRecursion.o

recursived: basicClassification.o advancedClassificationLoop.o NumClass.h
	gcc -shared -o libclassrec.so basicClassification.o advancedClassificationLoop.o -lm

loopd: basicClassification.o advancedClassificationRecursion.o NumClass.h
	gcc -shared -o libclassloops.so basicClassification.o advancedClassificationRecursion.o -lm

mains: main.o recurcives
	gcc -Wall -g -o mains main.o libclassrec.a -lm

maindloop: main.o loopd
	gcc -Wall -g -o maindloop main.o ./libclassloops.so -lm

maindrec:
	gcc -Wall -g -o maindrec main.o ./libclassrec.so -lm

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
	rm -f *.o *.a *.so maindloop mains maindrec: 


