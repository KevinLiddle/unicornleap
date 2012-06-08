CFLAGS += -std=c99
LDFLAGS += -framework Cocoa

cosbyleap: cosbyleap.o NSData+Base64.o image.o

clean:
	rm -f *.o cosbyleap
