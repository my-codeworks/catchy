require 'catchy/version'
require 'catchy/configuration'
require 'catchy/method_chain'

module Catchy

  class << self

    def new( *args )
      MethodChain.new( *args )
    end

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

  end
  
end
