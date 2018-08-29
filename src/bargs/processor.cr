module Bargs
  module Processor
    def process
      if ARGV.empty?
        # TODO print help message if specified, else silently return
        return
      end

      commandName = ARGV[0]
      command = commandName unless has_command?(commandName)
      puts "Command name is #{command}"
      parse_flags
    end

    def parse_flags
      @flags.each do |flag|
        longRegex = /--[a-z]+/
        shortRegex = /-[a-z]+/
        ARGV.each_with_index do |arg, index|
          long_match = arg.match(longRegex)
          short_match = arg.match(shortRegex)

          if long_match
            if ARGV.size >= index + 1
              # Check if the next argument in the list is a flag
              next_val = ARGV.at(index + 1)
              if is_flag?(next_val)
                next
              else
                puts "Flag #{flag.name} found, value: #{next_val}"
              end
            else
              puts "Flag found. Value is true."
            end
          elsif short_match
            puts "Flag #{flag.name} found."
          end
        end
      end
    end
  end
end
