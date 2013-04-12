require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Fixnum do
  it "shuld eval to self" do
    2.eval.should be == 2
  end

  it "should change to negative" do
    2.to_negative.should be == -2
  end

  it "should be simplified" do
    2.should be_simplified
  end

  it "should be an endpoint" do
    2.should be_endpoint
  end

  it "should raise an exception when you want to get its next step" do
    lambda { 2.next_step }.should raise_exception
  end
end
