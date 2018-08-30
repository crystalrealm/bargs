module Bargs
  class ProcessedFlag
    getter name, arg

    def initialize(@name : String, *arg)
      @arg = !arg.empty? ? arg.at(0).as(String) : nil
    end

    def has_arg?
      @arg != nil
    end
  end
end
