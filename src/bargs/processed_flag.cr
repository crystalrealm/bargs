module Bargs
  class ProcessedFlag
    @arg : String | Nil
    getter name
    getter arg

    def initialize(@name : String, *arg)
      puts "processedflag wee"

      if !arg.empty?
        @arg = arg.at(0)
      end
    end

    def has_arg?
      !@arg.nil?
    end
  end
end
