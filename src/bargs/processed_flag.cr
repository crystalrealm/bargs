module Bargs
  class ProcessedFlag
    getter name, arg

    def initialize(@name : String, @arg : String | Nil)
    end

    def has_arg?
      !@arg.nil?
    end
  end
end
