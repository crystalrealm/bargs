# Bargs

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://github.com/ellerbrock/open-source-badge/)
[![Open Source Love](https://badges.frapsoft.com/os/mit/mit.svg?v=102)](https://github.com/ellerbrock/open-source-badge/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

> The ultimate Command Line Interface builder for `Crystal`

`Bargs` aims to be the successor to `Commander`, while remaining tiny, unopinionated, and simple to use.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  bargs:
    github: crystalrealm/bargs
```

## Usage

```crystal
require "bargs"

# Creating a new Bargs interface
# By default, Bargs uses the global ARGV variable, but you can also specify an array of strings, and it will use that.
interface = Bargs::CLI.new

# This message gets shown if no flags or commands are given.
interface.help = "Help message goes here."

# Add an 'install' command
interface.command "install"

# Define a save flag. Also making sure it accepts an argument.
interface.flag "save" do |flag|
  flag.short = "s"

  # NOTE: This here is totally optional.
  flag.accepts_arg = true
end

args = interface.process
```

Here, `args` contains a `Bargs::ProcessedInput`.

A processed input contains the following fields & methods:

### .command_name

Returns the parsed command, if any.

### .has?(flag_name : String) : Bool

Returns true if the given flag name was matched in the input.

### .get(flag_name : String) : Bargs::Flag

Returns the flag matched with the given name.

_Also note: A flag will always be stored with their long names in focus, so you need to provide the actual long flag name to get & has?._

## Contributing

1.  Fork it (<https://github.com/crystalrealm/bargs/fork>)
2.  Create your feature branch (`git checkout -b my-new-feature`)
3.  Commit your changes (`git commit -am 'Add some feature'`)
4.  Push to the branch (`git push origin my-new-feature`)
5.  Create a new Pull Request

## Contributors

- [molnarmark](https://github.com/molnarmark) Mark Molnar - creator, maintainer
