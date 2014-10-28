class String
  def word_wrap line_length
    words = self.split(' ')
    counter = 0
    final_string = ''
    reminder = 0
    words.each do |item|
      #puts 'counter ' + counter.to_s
      #puts 'item: ' + item
      counter+= item.length
      if (counter <= line_length)
        final_string+=item + ' '
        counter+=1
      else
        if (item.length > line_length)
          final_string+="\n" + item + "\n"
          counter = 0;
          reminder = 0;
          next;
        end
        reminder = counter - line_length
        #puts 'should be negative ' + reminder.to_s
        final_string+="\n" + item + ' '
        counter = reminder + 1
      end
    end
    result = final_string[0] == "\n" ? final_string.reverse.chop.reverse : final_string
    result.split("\n").each do |item|
      item.chop!
    end
  end
end

puts "  \nHow much wood would\na woodchucssssssssssssssssssssk chuck if a woodchuck could chuck wood?\n   As much as a woodchuck would chuck if a woodchuck could chuck wood.\n\n ".word_wrap(20)