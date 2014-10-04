CFLAGS += -std=c99
LDFLAGS += -framework Cocoa

cosbyleap: unicosbyleap.o NSData+Base64.o cosby.o
#unicornleap: unicosbyleap.o NSData+Base64.o unicorn.o

clean:
	rm -f *.o cosbyleap #unicornleap
