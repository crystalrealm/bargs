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

interface = Bargs::CLI.new

interface.help = "\
Please do nothing.
"

interface.flag "help" do |flag|
  flag.short = "h"
end

interface.flag "save" do |flag|
  flag.short = "s"
end

interface.command "install" do |cmd|
  cmd.description = "Install some stuff."
end

params = interface.process
if params.has?("save")
  puts "Saving stuff.."
end
