require 'spec_helper'

describe IntegerHash do
  before do
    IntegerHash.configure do |config|
      config.prime = 1580030173
      config.inverse_integer = 59260789
      config.random_integer = 1163945558
    end
  end

  after do
    IntegerHash.configuration = IntegerHash::Configuration.new
  end

  it 'has a version number' do
    expect(IntegerHash::VERSION).not_to be nil
  end

  it 'returns the same value when encoded and then decoded' do
    expect(IntegerHash.decode(IntegerHash.encode(42))).to eq(42)
  end

  it 'delegates attributes to configuration' do
    expect(IntegerHash.prime).to eq(1580030173)
    expect(IntegerHash.inverse_integer).to eq(59260789)
    expect(IntegerHash.random_integer).to eq(1163945558)
    expect(IntegerHash.max_integer).to eq(2**31-1)
  end
end
