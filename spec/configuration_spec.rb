require 'spec_helper'

describe IntegerHash::Configuration do
  before do
    IntegerHash.configure do |config|
      config.prime = 838041647
      config.inverse_integer = 838041661
      config.random_integer = 838041689
    end
  end

  after do
    IntegerHash.configuration = IntegerHash::Configuration.new
  end

  it 'has a prime configurable attribute' do
    expect(IntegerHash.configuration).to respond_to(:prime)
    expect(IntegerHash.configuration.prime).to eq 838041647
    IntegerHash.configuration.prime = 838041649
    expect(IntegerHash.configuration.prime).to eq 838041649
  end

  it 'has a inverse_integer configurable attribute' do
    expect(IntegerHash.configuration).to respond_to(:inverse_integer)
    expect(IntegerHash.configuration.inverse_integer).to eq 838041661
    IntegerHash.configuration.inverse_integer = 838041667
    expect(IntegerHash.configuration.inverse_integer).to eq 838041667
  end

  it 'has a random_integer configurable attribute' do
    expect(IntegerHash.configuration).to respond_to(:random_integer)
    expect(IntegerHash.configuration.random_integer).to eq 838041689
    IntegerHash.configuration.random_integer = 838041691
    expect(IntegerHash.configuration.random_integer).to eq 838041691
  end

  it 'has a max_integer configurable attribute with a default value' do
    expect(IntegerHash.configuration).to respond_to(:max_integer)
    expect(IntegerHash.configuration.max_integer).to eq 2**31-1
    IntegerHash.configuration.max_integer = 2**2
    expect(IntegerHash.configuration.max_integer).to eq 2**2
  end
end
