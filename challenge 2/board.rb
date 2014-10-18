def render_tic_tac_toe_board_to_ascii board
  rendered_board = ''
  counter = 0
  board.each do |symbol|
    counter%3 == 0 && counter!=0 ? rendered_board+= "\n" : rendered_board
    symbol.class == Symbol ? symbol = symbol.to_s : symbol
    if (symbol.class == NilClass)
      rendered_board += '|   |'
    else
      rendered_board += '| ' + symbol + ' |'
    end
    counter+=1
  end
  puts rendered_board.gsub(/\|{2,}/, '|')
end