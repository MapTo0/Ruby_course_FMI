describe 'String#word_wrap' do
  it 'reduces the empty string to an empty array' do
    expect(''.word_wrap(2)).to eq []
  end

  it 'can split words given exact length' do
    expect('one two'.word_wrap(3)).to eq ['one', 'two']
  end

  it 'can split longer text' do
    expect("  \nHow much wood would\na woodchuck chuck if a woodchuck could chuck wood?\n   As much as a woodchuck would chuck if a woodchuck could chuck wood.\n\n ".word_wrap(20)).to eq [
                                               "How much wood would",
                                               "a woodchuck chuck if",
                                               "a woodchuck could",
                                               "chuck wood? As much",
                                               "as a woodchuck would",
                                               "chuck if a woodchuck",
                                               "could chuck wood."
                                             ]
  end

  it 'leaves long words on one row' do
    expect("  \nHow much wood would\na woodchucssssssssssssssssssssk chuck if a woodchuck could chuck wood?\n   As much as a woodchuck would chuck if a woodchuck could chuck wood.\n\n ".word_wrap(20)).to eq [
                                               "How much wood would",
                                               "a",
                                               "woodchucssssssssssssssssssssk",
                                               "chuck if a woodchuck",
                                               "could chuck wood? As",
                                               "much as a woodchuck",
                                               "would chuck if a",
                                               "woodchuck could",
                                               "chuck wood."
                                             ]
  end
  it 'returns the same result for word wrap, and word \n wrap' do
    expect("word wrap".word_wrap(1)).to eq ["word", "wrap"]
  end
end