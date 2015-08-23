module IntegerHash
  class Configuration
    attr_accessor :prime
    attr_accessor :inverse_integer
    attr_accessor :random_integer
    attr_accessor :max_integer

    def initialize values = {}
      @prime = values[:prime]
      @inverse_integer = values[:inverse_integer]
      @random_integer = values[:random_integer]
      @max_integer = 2**(values[:size] || 31)-1
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
