## About

Make trolls and unicorns jump across the bottom of your screen.

Perfect for running when your automated tests pass.

## Install

`make trolleap unicornleap`

Put the "trolleap" and "unicornleap" commands somewhere on your PATH

## Usage

### RSpec
Copy `.rspec.example` to your home directory as `.rspec`, and set the path to unicorn_leap.rb

### Leiningen
Copy `profiles.clj.example` as `profiles.clj` into your local `~/.lein/` directory.

When running specs you can add the `unicornleap` formatter with `lein spec -f p -f unicornleap`.

## Credits

NSData extensions for Base64 by Matt Gallagher.

Algorithm by Josh Cheek and Michael Baker.
The rest of the code by Steven Degutis, and the repo ended up in my control because I forked it and he deleted his github account.
