module Bargs
  class Flag
    @is_a : String | Nil
    @short : String | Nil
    setter is_a, short
    getter is_a, short
    getter name

    def initialize(@name : String)
    end
  end
end
