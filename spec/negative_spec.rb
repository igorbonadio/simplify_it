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

    it "should set an expression to negative" do
      expression = Negative.new(Addition.new(1, 2, 3, 4))
      expression.eval.should be == -10
    end

    it "should set an expression to negative" do
      expression = Negative.new(Addition.new(1, Negative.new(2), 3, 4))
      expression.eval.should be == -6
    end

    it "should have a string representation" do
      Negative.new(3).to_s.should eq "(-3)"
      Negative.new(Negative.new(3)).to_s.should eq "(-(-3))"
      Negative.new(Addition.new(1, 2, 3, 4)).to_s.should eq "(-(1+2+3+4))"
    end
  end
end