module Bargs
  class ProcessedInput
    @command_name : String | Nil
    @flags = [] of Bargs::ProcessedFlag

    def initialize(@command_name, @flags = [] of Bargs::ProcessedFlag)
    end

    def get(flag_name)
      pp @flags
      result = @flags.find { |flag| flag.name === flag_name }
      result.as(Bargs::ProcessedFlag)
    end

    def has?(flag_name)
      result = get(flag_name)
      if result.nil?
        false
      else
        true
      end
    end
  end
end
