CFLAGS += -std=c99
LDFLAGS += -framework Cocoa

unicornleap: unicornleap.o NSData+Base64.o image.o

clean:
	rm -f *.o unicornleap
