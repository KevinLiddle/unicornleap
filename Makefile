CFLAGS += -std=c99
LDFLAGS += -framework Cocoa
VPATH = src

trolleap: trolleap.o NSData+Base64.o troll.o leap.o
unicornleap: unicornleap.o NSData+Base64.o unicorn.o leap.o

clean:
	rm -f *.o trolleap unicornleap
