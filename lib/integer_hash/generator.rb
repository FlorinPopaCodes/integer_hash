require 'gmp'

module IntegerHash
  class Generator
    def self.generate_configuration(size = 31, prime = nil)
      return Configuration.new(Generator.new(size: size, prime: prime).generate_configuration)
    end

    def initialize(values = {})
      @size = values[:size]
      @prime = values[:prime]
      #TODO BN requires it to be > 16 or the bites are too small
      raise ArgumentError if @size < 16
    end

    def generate_configuration
      @prime ||=  generate_prime
      inverse_integer = generate_inverse
      random_integer = generate_random

      {prime: @prime.to_i, inverse_integer: inverse_integer.to_i, random_integer: random_integer.to_i}
    end

    def generate_prime
      OpenSSL::BN.generate_prime(@size)
    end

    def generate_inverse
      OpenSSL::BN.new(@prime).mod_inverse(2**@size)
    end

    def generate_random
      OpenSSL::BN.rand(@size)
    end
  end
end
