def format_string(str, width)
  no_spaces = str.gsub(/^\s\s*/, '').gsub(/\s\s*$/, '').gsub(/\s{2,}/, ' ')

  upcase_word = no_spaces.upcase

  if no_spaces.size < width

    spaces = width - no_spaces.size
      for i in 0..spaces-1
        if i.odd?
          upcase_word.insert 0, ' '
        else
          upcase_word.insert upcase_word.size, ' '
        end
      end
  end
  puts upcase_word
end

format_string('odd', 4)