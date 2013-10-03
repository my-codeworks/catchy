class Catchy::MethodChain

  def initialize( options = {} )
    options = Catchy::DEFAULT_OPTIONS.merge( options )
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
    self.class.send( :define_method, to_s_name ) do
      @method_chain.join('.')  
    end
  end

end