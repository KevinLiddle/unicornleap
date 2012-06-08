## About

Make Bill Cosby jump across the bottom of your screen.

Perfect for running when your automated tests pass.

## Install

Use `make` to generate the `cosbyleap` binary. Put it somewhere in your path.

## Usage

For running if and when your tests pass:

```bash
$ rspec && cosbyleap
```

For running randomly as you work:

```bash
$ nohup ./cosbyleapingoften > /dev/null &
$ exit
```

## Credits

NSData extensions for Base64 by Matt Gallagher.

Algorithm by Josh Cheek and Michael.
