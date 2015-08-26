require 'integer_hash'
require 'active_record'

module IntegerHash
  module Rails
    def encode_id
      require 'integer_hash'
      extend ClassMethods
      include InstanceMethods

      cattr_accessor :integer_hash_configuration

    end

    module ClassMethods
      def find(*args)
        scope = args.slice!(0)
        options = args.slice!(0) || {}
        if has_encoded_id? && !options[:no_hashed_id]
          if scope.is_a?(Array)
            scope.map! {|a| IntegerHash.decode(a.to_i).to_s}
          else
            scope = IntegerHash.decode(scope.to_i).to_s
          end
        end
        super(scope)
      end

      def has_encoded_id?
        true
      end
    end

    module InstanceMethods
      def to_param
        IntegerHash.encode(self.id).to_s
      end

      # Override ActiveRecord::Persistence#reload
      # passing in an options flag with { no_hashed_id: true }
      def reload(options = nil)
        options = (options || {}).merge(no_hashed_id: true)

        clear_aggregation_cache
        clear_association_cache

        fresh_object =
          if options && options[:lock]
            self.class.unscoped { self.class.lock(options[:lock]).find(id, options) }
          else
            self.class.unscoped { self.class.find(id, options) }
          end

        @attributes = fresh_object.instance_variable_get('@attributes')
        @new_record = false
        self
      end
    end
  end
end

ActiveRecord::Base.extend IntegerHash::Rails
