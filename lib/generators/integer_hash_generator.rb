require 'integer_hash/generator'

class IntegerHashGenerator < Rails::Generators::Base
  def create_new_configuration
    IntegerHash::Generator.generate_configuration
  end

  def create_initializer_file
    configuration = create_new_configuration

    create_file "config/initializers/integer_hash.rb", <<-FILE
IntegerHash.configure do |config|
  config.prime = #{configuration.prime}
  config.inverse_integer = #{configuration.inverse_integer}
  config.random_integer = #{configuration.random_integer}
end
    FILE
  end
end
