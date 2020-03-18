require 'spec_helper'

array_1 = ["", "hello", "world", 4, 1, 5, [], {}]
array_2 = ["", 4, "", "goodbye",""]

describe 'count_strings' do
  it 'takes in an array of varying data types and returns the total number of strings' do
    expect(count_strings(array_1)).to eq(3)
    expect(count_strings(array_2)).to eq(4)
  end
end


describe 'count_empty_strings' do
  it 'takes in an array of varying data types and returns the total number of EMPTY strings' do
    expect(count_empty_strings(array_1)).to eq(1)
    expect(count_empty_strings(array_2)).to eq(3)
  end
end
