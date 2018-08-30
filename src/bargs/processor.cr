module Bargs
  module Processor
    LONG_REGEX  = /--[a-z]+ ?[a-z]+/
    SHORT_REGEX = / -[a-z]/

    def process
      if @input.empty?
        puts @help
        Process.exit(0)
      end

      command_name = @input[0]
      command = command_name unless has_command?(command_name)
      parse_flags(command).as(Bargs::ProcessedInput)
    end

    def parse_flags(command_name)
      args_joined = @input.join(" ")
      long_args_matches = args_joined.scan(LONG_REGEX).map(&.to_a)
      short_matches = args_joined.scan(SHORT_REGEX).map(&.to_a)
      all_matches = long_args_matches.concat(short_matches)
        .flatten
        .map(&.to_s)
        .map(&.lchop(" "))

      processed_flags = [] of ProcessedFlag
      args_as_array = @input.to_a
      args_as_array.delete(command_name)
      all_matches.each do |match|
        split_match = match.split(" ")
        flag_name = split_match[0].gsub("-", "")
        flag_arg = split_match[1] unless split_match.size < 2
        found_flag = @flags.find { |flag| flag.name == flag_name || flag.short == flag_name }

        # TODO might be a better way to do this?
        if !found_flag.is_a?(Nil)
          if flag_arg && found_flag.accepts_arg
            processed_flags.push(Bargs::ProcessedFlag.new(found_flag.name, flag_arg))
            args_as_array.delete(flag_arg)
          else
            processed_flags.push(Bargs::ProcessedFlag.new(found_flag.name, nil))
          end
          args_as_array.delete("--#{flag_name}")
          args_as_array.delete("-#{flag_name}")
        end
      end

      Bargs::ProcessedInput.new(command_name, processed_flags, args_as_array)
    end
  end
end
