module Bargs
  class Command
    @description : String | Nil
    setter description
    getter name

    def initialize(@name : String)
    end
  end
end
