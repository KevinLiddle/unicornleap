#import "leap.h"

int leap (NSString *imageString, int argc, char * argv[]) {
    [NSAutoreleasePool new];
    [NSApplication sharedApplication];

    CGFloat W = [[NSScreen mainScreen] frame].size.width;
    CGFloat H = [[NSScreen mainScreen] frame].size.height;

    CGFloat UW = W / 4.0;
    CGFloat UH = UW; // meh
    CGFloat ECCENTRICITY = -0.0009;

    NSRect leapRect = NSMakeRect(W / 2.0 - (UW / 2.0),
                                    H / 2.0 - (UH / 2.0),
                                    UW,
                                    UH);

    NSWindow *window = [[NSWindow alloc] initWithContentRect:leapRect
                                                   styleMask:NSBorderlessWindowMask
                                                     backing:NSBackingStoreBuffered
                                                       defer:NO];
    [window setBackgroundColor:[NSColor colorWithCalibratedHue:0 saturation:0 brightness:0 alpha:0.0]];
    [window setOpaque:NO];
    [window setLevel:NSFloatingWindowLevel];

    NSImage *image = [[NSImage alloc] initWithData:[NSData dataFromBase64String:imageString]];
    NSImageView *view = [[NSImageView alloc] initWithFrame:leapRect];
    [view setImage:image];
    [window setContentView:view];

    int userSpeed = 100;
    if (argc >= 2) {
      if (strcmp(argv[1], "-v") == 0 || strcmp(argv[1], "--version") == 0) {
        printf("%s version 1.0\n", argv[0]);
        return 0;
      }
      else if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0) {
        printf("usage: %s [-h] [-v] [N]\n", argv[0]);
        printf("   where N is a whole number specifying the percent of normal speed to run\n");
        printf("   example: %s 100   # runs at normal speed\n", argv[0]);
        printf("   example: %s 50    # runs at half speed\n", argv[0]);
        printf("   example: %s 500   # runs at 5 times normal speed\n", argv[0]);
        return 0;
      }

      userSpeed = [[NSString stringWithUTF8String:argv[1]] intValue];
      if (userSpeed == 0) {
        printf("Just how do you expect anything to leap at 0%% speed?\n");
        return 0;
      }
    }

    printf("running at %d%% speed\n", userSpeed);

    int peak = 100;
    if (argc == 3) {
      peak = [[NSString stringWithUTF8String:argv[2]] intValue];
      if (peak <= 0) {
        printf("What's the point of leaping if the peak is 0?\n");
        return 0;
      } else if (peak > 100) {
        printf("Let's be real, you don't want a peak past %i\n", peak);
        return 0;
      }
    }

    for (CGFloat x = -200.0; x < W; x += 20.0 * (CGFloat)userSpeed / 100.0) {
      CGFloat y = (ECCENTRICITY * pow(x, 2.0)) + ((peak / 100.0) + 0.5) * x;

      NSRect leapRect = NSMakeRect(x, y, UW, UH);
      printf("x %f\n", x);
      printf("y %f\n", y);

      [window setFrame:leapRect display:YES animate:NO];
      [window makeKeyAndOrderFront:nil];
    }

    return 0;
}
