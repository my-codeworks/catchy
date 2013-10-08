class Catchy::MethodChain

  def initialize( options = {} )
    configure( options )
    define_methods
    @method_chain = []
  end

  def method_missing(name)
    @method_chain << name
    return self
  end

private

  def configure( options )
    return if options.empty?
    Catchy.configure do |config| 
      options.each do |name, value|
        config.send("#{name}=", value)
      end
    end
  end

  def define_method( name, &block)
    self.class.send( :define_method, name, &block )
  end

  def define_methods
    define_method( Catchy.configuration.to_s ){ @method_chain.join('.') }
  end

end