module Bargs
  class Flag
    @short : String | Nil
    setter short
    getter short
    getter name

    def initialize(@name : String)
    end
  end
end
