CFLAGS += -std=c99
LDFLAGS += -framework Cocoa

unicorn: unicorn.o NSData+Base64.o image.o
