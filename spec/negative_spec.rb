require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Negative do
    it "should set a number to negative" do
      number = Negative.new(3)
      number.eval.should be == -3
    end

    it "should set a negative number to positive" do
      number = Negative.new(Negative.new(3))
      number.eval.should be == 3
    end
  end
end