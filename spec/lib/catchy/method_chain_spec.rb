require 'spec_helper'
require 'catchy/method_chain'

describe Catchy::MethodChain do

  context "basic use" do
    describe "initialization" do
      subject { Catchy.new() }
      it { should_not be_nil }
    end

    describe "returns a method chain proxy when called" do
      subject { Catchy.new().whatever.class }
      it { should == Catchy::MethodChain }
    end

    describe "to_s yields chained calls" do
      subject { Catchy.new().can.be.called.by.whatever.to_s }
      it { should == 'can.be.called.by.whatever' }
    end
  end

  context "customizing behaviour" do
    describe "overriding default to_s method name" do
      subject { Catchy.new(to_s: :__to_s).can.be.called.by.whatever.__to_s }
      it { should == 'can.be.called.by.whatever' }
    end
  end

end