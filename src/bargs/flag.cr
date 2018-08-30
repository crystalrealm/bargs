module Bargs
  class Flag
    @short : String | Nil
    @accepts_arg : Bool
    setter short, accepts_arg
    getter name, accepts_arg, short

    def initialize(@name : String, @accepts_arg = false)
    end
  end
end
