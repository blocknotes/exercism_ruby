module Grep
  module_function

  def grep(pattern, flags, files)
    options = prepare_options(flags)
    options[:multiple_files] = files.size > 1
    results = files.each_with_object({}) do |file, list|
      list[file] = search_in_file(file, pattern, options: options)
    end
    present_results(results, options: options)
  end

  def prepare_options(flags)
    {}.tap do |options|
      options[:case_insensitive] = flags.include?('-i')
      options[:file_names] = flags.include?('-l')
      options[:line_numbers] = flags.include?('-n')
      options[:invert] = flags.include?('-v')
      options[:match_entire_line] = flags.include?('-x')
    end
  end

  def search_in_file(file, pattern, options:)
    lines = File.readlines(file, chomp: true)
    if options[:line_numbers]
      result = lines.map.with_index.select { |line, _| search_string(line, pattern, options: options) }
      result.map { |line, number| "#{number + 1}:#{line}" }
    else
      lines.select { search_string(_1, pattern, options: options) }
    end
  end

  def search_string(line, pattern, options:)
    method = options[:match_entire_line] ? :== : :include?
    match = options[:case_insensitive] ? line.downcase.send(method, pattern.downcase) : line.send(method, pattern)
    options[:invert] ? !match : match
  end

  def present_results(results, options:)
    list = results.reject { _2.empty? }.filter_map do |filename, matches|
      if options[:file_names]
        filename
      elsif options[:multiple_files]
        matches.map { "#{filename}:#{_1}" }.join("\n")
      else
        matches.join("\n")
      end
    end
    list.join("\n")
  end
end
