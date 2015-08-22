require "integer_hash/version"
require "integer_hash/configuration"

module IntegerHash
  def self.encode(value)
    ((value * prime) & max_integer) ^ random_prime
  end

  def self.decode(value)
    ((value ^ random_prime) * inverse_prime) & max_integer
  end

  protected

  def self.prime
    configuration.prime
  end

  def self.inverse_prime
    configuration.inverse_prime
  end

  def self.random_prime
    configuration.random_prime
  end

  def self.max_integer
    configuration.max_integer
  end
end
