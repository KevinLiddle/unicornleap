#import <Cocoa/Cocoa.h>
#import "NSData+Base64.h"
#import "image.h"

int main (int argc, const char * argv[]) {
    [NSAutoreleasePool new];
    [NSApplication sharedApplication];

    CGFloat W = [[NSScreen mainScreen] frame].size.width;
    CGFloat H = [[NSScreen mainScreen] frame].size.height;

    CGFloat UW = W / 4.0;
    CGFloat UH = UW; // meh
    CGFloat W_HALF = W / 2.0;
    CGFloat UW_HALF = UW / 2.0;

    NSRect unicornRect = NSMakeRect(W / 2.0 - (UW / 2.0),
                                    H / 2.0 - (UH / 2.0),
                                    UW,
                                    UH);

    NSWindow *window = [[NSWindow alloc] initWithContentRect:unicornRect
                                                   styleMask:NSBorderlessWindowMask
                                                     backing:NSBackingStoreBuffered
                                                       defer:NO];
    [window setBackgroundColor:[NSColor colorWithCalibratedHue:0 saturation:0 brightness:0 alpha:0.0]];
    [window setOpaque:NO];
    [window setLevel:NSFloatingWindowLevel];

    NSImage *unicornImage = [[NSImage alloc] initWithData:[NSData dataFromBase64String:UnicornImageString]];
    NSImageView *unicornView = [[NSImageView alloc] initWithFrame:unicornRect];
    [unicornView setImage:unicornImage];
    [window setContentView:unicornView];

    for (CGFloat x = -100.0; x < W; x += 20.0) {
        CGFloat y = UH/40.0 - (pow(x-W_HALF, 2.0) / W_HALF / 2.0);

        NSRect unicornRect = NSMakeRect(x-UW_HALF, y, UW, UH);

        [window setFrame:unicornRect display:YES animate:NO];
        [window makeKeyAndOrderFront:nil];

        /*
        struct timespec tim, tim2;
        tim.tv_sec  = 0;
        tim.tv_nsec = 1000L;
        nanosleep(&tim , &tim2);
        */
    }

    return 0;
}
