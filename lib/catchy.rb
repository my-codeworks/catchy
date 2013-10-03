require 'catchy/version'
require 'catchy/method_chain'

module Catchy

  DEFAULT_OPTIONS = {
    to_s: :to_s,
  }

  def self.new( *args )
    MethodChain.new( *args )
  end
  
end
