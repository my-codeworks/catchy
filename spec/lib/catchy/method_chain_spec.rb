require 'spec_helper'
require 'catchy'

describe Catchy::MethodChain do

  context "basic use" do
    describe "returns a method chain proxy when called" do
      subject { Catchy.new.whatever.class }
      it { should == Catchy::MethodChain }
    end

    describe "to_s yields chained calls" do
      subject { Catchy.new.can.be.called.by.whatever.to_s }
      it { should == 'can.be.called.by.whatever' }
    end
  end

  context "customized behaviour" do
    describe "overriding default to_s method name with initializer" do
      subject { Catchy.new(to_s: :__to_s).can.be.called.by.whatever.__to_s }
      it { should == 'can.be.called.by.whatever' }
    end

    describe "overriding default to_s method name with configure block" do
      subject { Catchy.configure{|config| config.to_s = :__to_s}; Catchy.new.can.be.called.by.whatever.__to_s }
      it { should == 'can.be.called.by.whatever' }
    end
  end

end