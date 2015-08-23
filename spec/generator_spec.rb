require 'spec_helper'
require 'integer_hash/generator'

describe IntegerHash::Generator do
  let(:configuration) { IntegerHash::Generator.generate_configuration(31, 1580030173) }

  it 'generates a valid configuration from a selected prime' do
    expect(configuration).to be_an_instance_of(IntegerHash::Configuration)
    expect(configuration.prime).to eq 1580030173
    expect(configuration.inverse_integer).to eq 59260789
    expect(configuration.random_integer).not_to be_nil

    expect(configuration.prime).to be < configuration.max_integer
    expect(configuration.inverse_integer).to be < configuration.max_integer
    expect(configuration.random_integer).to be < configuration.max_integer
  end

  let(:configuration2) { IntegerHash::Generator.generate_configuration }

  it 'generates a valid default configuration' do
    expect(configuration).to be_an_instance_of(IntegerHash::Configuration)

    expect(configuration.prime).to be < configuration.max_integer
    expect(configuration.inverse_integer).to be < configuration.max_integer
    expect(configuration.random_integer).to be < configuration.max_integer

    IntegerHash.configuration = configuration2

    expect(IntegerHash.decode(IntegerHash.encode(123456))).to eq(123456)

  end
end
