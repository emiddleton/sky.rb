class SkyDB
  class Table
    ##########################################################################
    #
    # Constants
    #
    ##########################################################################

    DEFAULT_TABLET_COUNT = 4
    

    ##########################################################################
    #
    # Constructor
    #
    ##########################################################################

    # Initializes the table.
    def initialize(name='', options={})
      self.name = name
      self.tablet_count = options[:tablet_count].to_i
    end
    

    ##########################################################################
    #
    # Attributes
    #
    ##########################################################################

    ##################################
    # Name
    ##################################

    # The name of the table.
    attr_reader :name
    
    def name=(value)
      @name = value.to_s
    end


    ##################################
    # Tablet count
    ##################################

    # The number of tablets the table has
    attr_reader :tablet_count
    
    def tablet_count=(value)
      @tablet_count = value.to_i || DEFAULT_TABLET_COUNT
    end


    ##########################################################################
    #
    # Methods
    #
    ##########################################################################
    
    # Encodes the table into MsgPack format.
    def to_msgpack
      return {
        name: name,
        tablet_count: tablet_count
      }.to_msgpack
    end

    # Encodes the table into JSON format.
    def to_json(*a)
      {
        'name' => name
      }.to_json(*a)
    end
  end
end