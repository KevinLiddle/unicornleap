## About

Make a unicorn jump across the bottom of your screen.

Perfect for running when your automated tests pass.

## Install

Use `make` to generate the `unicornleap` binary. Put it somewhere in your path.

## Usage

For running if and when your tests pass:

```bash
$ rspec && unicornleap
```

For running randomly as you work:

```bash
$ nohup ./unicornleapingoften > /dev/null &
$ exit
```

## Credits

NSData extensions for Base64 by Matt Gallagher.

Algorithm by Josh Cheek and Michael.
