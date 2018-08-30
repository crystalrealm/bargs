require "./bargs/*"

module Bargs
  VERSION = "1.0.0"

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
      @commands.push(command)
    end
  end
end
