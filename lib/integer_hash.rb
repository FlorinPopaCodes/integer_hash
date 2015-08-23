require "integer_hash/version"
require "integer_hash/configuration"

module IntegerHash
  def self.encode(value)
    ((value * prime) & max_integer) ^ random_integer
  end

  def self.decode(value)
    ((value ^ random_integer) * inverse_integer) & max_integer
  end

  protected

  def self.prime
    configuration.prime
  end

  def self.inverse_integer
    configuration.inverse_integer
  end

  def self.random_integer
    configuration.random_integer
  end

  def self.max_integer
    configuration.max_integer
  end
end
