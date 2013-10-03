class Catchy::MethodChain

  DEFAULT_OPTIONS = {
    to_s: :to_s,
  }

  def initialize( options = {} )
    options = DEFAULT_OPTIONS.merge( options )
    define_accessors( options )
    @method_chain = []
  end

  def method_missing(name)
    @method_chain << name
    return self
  end

private

  def define_accessors( options )
    define_to_string_as( options[:to_s] )
  end

  def define_to_string_as( to_s_name )
    puts "Defining #{to_s_name} as to_s"
    self.class.send( :define_method, to_s_name ) do
      @method_chain.join('.')  
    end
  end

end