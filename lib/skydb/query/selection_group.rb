class SkyDB
  # The selection group contains an expression by which to group selected
  # data.
  class Query
    class SelectionGroup
      ##########################################################################
      #
      # Constructor
      #
      ##########################################################################

      def initialize(options={})
        self.expression = options[:expression]
      end
    

      ##########################################################################
      #
      # Attributes
      #
      ##########################################################################

      # The name of the expression to group by.
      attr_accessor :expression

      # The string used to access the expression.
      def accessor(options={})
        prefix = options.delete(:prefix) || 'cursor.event.'
        
        if ["action_id", "timestamp"].index(expression)
          return "#{prefix}#{expression}"
        else
          return "#{prefix}#{expression}()"
        end
      end
      

      ##########################################################################
      #
      # Methods
      #
      ##########################################################################

      ####################################
      # Validation
      ####################################

      # Validates that the field is valid.
      def validate!
        # Expression must be present.
        if expression.to_s.length == 0
          raise SkyDB::Query::ValidationError.new("Invalid expression for selection group: '#{expression.to_s}'")
        end
      end
    end
  end
end