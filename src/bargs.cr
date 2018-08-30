# TODO: Write documentation for `Bargs`

require "./bargs/*"

module Bargs
  VERSION = "0.1.0"

  class CLI
    getter commands, flags
    setter help

    @help : String

    include Bargs::Processor
    include Bargs::Utils

    def initialize(*input)
      @input = [] of String
      @flags = [] of Bargs::Flag
      @commands = [] of Bargs::Command
      @input = !input.empty? ? input.at(0) : ARGV.to_a
      @help = ""
    end

    def flag(name)
      flag = Bargs::Flag.new(name)
      yield flag
      @flags.push(flag)
    end

    def command(name)
      command = Bargs::Command.new(name)
      yield command
      @commands.push(command)
    end
  end
end

# interface = Bargs::CLI.new

# interface.flag "save" do |flag|
#   flag.short = "s"
#   flag.accepts_arg = true
# end
# bargs = interface.process
# pp bargs.get("save").sum
