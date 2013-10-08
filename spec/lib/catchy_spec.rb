require 'spec_helper'
require 'catchy'

describe Catchy do

  describe "instanziation" do
    
    it "works" do
      Catchy.new.should_not be_nil
    end

    it "provides default configuration" do
      Catchy.configuration.should_not be_nil
    end

  end

end