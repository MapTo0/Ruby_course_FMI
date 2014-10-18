def series(name, number)
  if name == 'fibonacci'
    sequence(1, 1, number)
  elsif name == 'lucas'
    sequence(2, 1, number)
  else
    sequence(1, 1, number) + sequence(2, 1, number)
  end
end

def sequence(first, second, number)
  if number == 1
    first
  else
    sequence(second, first + second, number - 1)
  end
end

series('lucal', 16)