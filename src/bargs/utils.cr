module Bargs
  module Utils
    def has_command?(name)
      @commands.each do |command|
        if command.name == name
          true
        end
      end

      false
    end

    def get_command(name)
      @commands.each do |command|
        if command.name == name
          command
        end
      end
      nil
    end

    def is_flag?(string)
      string.starts_with?("--") || string.starts_with?("-")
    end
  end
end
