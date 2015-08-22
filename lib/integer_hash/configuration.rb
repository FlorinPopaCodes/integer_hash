require "integer_hash/version"

module IntegerHash
  class Configuration
    attr_accessor :prime
    attr_accessor :inverse_prime
    attr_accessor :random_prime
    attr_accessor :max_integer

    def initialize
      @max_integer = 2**31-1
    end
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(config)
    @configuration = config
  end

  def self.configure
    yield configuration
  end
end
