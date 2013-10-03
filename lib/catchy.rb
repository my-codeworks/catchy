require 'catchy/method_chain'

module Catchy

  def new( *args )
    MethodChain.new( *args )
  end

end
