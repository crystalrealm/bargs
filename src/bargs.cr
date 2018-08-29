# TODO: Write documentation for `Bargs`

require "./bargs/*"

module Bargs
  VERSION = "0.1.0"

  class CLI
    getter commands, flags
    include Bargs::Processor
    include Bargs::Utils

    def initialize
      @flags = [] of Bargs::Flag
      @commands = [] of Bargs::Command
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

interface.flag "help" do |flag|
  flag.short = "h"
  flag.is_a = "boolean"
end

interface.flag "save" do |flag|
  flag.short = "s"
  flag.is_a = "boolean"
end

interface.command "install" do |cmd|
  cmd.description = "Install some stuff."
end

interface.process
