module Bargs
  class ProcessedInput
    @command_name : String | Nil
    @flags = [] of Bargs::ProcessedFlag
    @rest = [] of String
    getter rest

    def initialize(@command_name, @flags = [] of Bargs::ProcessedFlag, @rest = [] of String)
    end

    def get(flag_name)
      result = @flags.find { |flag| flag.name === flag_name }
      result.as(Bargs::ProcessedFlag)
    end

    def has?(flag_name)
      result = get(flag_name)
      !result.nil?
    end
  end
end
