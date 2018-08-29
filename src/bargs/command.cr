module Bargs
  class Command
    @description : String | Nil
    setter description
    getter name

    def initialize(@name : String)
      puts "added new command"
    end
  end
end
