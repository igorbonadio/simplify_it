require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Positive do
    it "should set a positive number to positive" do
      Positive.new(3).eval.should be == 3
    end

    it "should not change a negative number" do
      Positive.new(-3).eval.should be == -3
    end

    it "should not change expressions" do
      Positive.new(Negative.new(Addition.new(1, 2, 3, 4))).eval.should be == -10
    end

    it "should have a string representation" do
      Positive.new(3).to_s.should be == "(+3)"
      Positive.new(-3).to_s.should be == "(+(-3))"
      Positive.new(Negative.new(Negative.new(3))).to_s.should eq "(+(-(-3)))"
      Positive.new(Negative.new(Addition.new(1, 2, 3, 4))).to_s.should eq "(+(-(1+2+3+4)))"
      Positive.new(Addition.new(1,2,3,4)).to_s.should eq "(+(1+2+3+4))"
      Positive.new(Addition.new(1,2,Multiplication.new(3,4,5),4)).to_s.should eq "(+(1+2+(3*4*5)+4))"
    end

    it "should simplify expressions" do
      Positive.new(3).simplify.to_s.should be == "3"
      Positive.new(-3).simplify.to_s.should be == "-3"
      Positive.new(Negative.new(3)).simplify.to_s.should eq "(-3)"
      Positive.new(Negative.new(Negative.new(3))).simplify.to_s.should eq "(-(-3))"
      Positive.new(Negative.new(Addition.new(1, 2, 3, 4))).simplify.to_s.should eq "(-(1+2+3+4))"
      Positive.new(Addition.new(1,2,3,4)).simplify.to_s.should eq "(1+2+3+4)"
    end

    it "should show the next step of expressions" do
      Positive.new(3).next_step.to_s.should be == "3"
      Positive.new(-3).next_step.to_s.should be == "-3"
      Positive.new(Negative.new(3)).next_step.to_s.should eq "(-3)"
      Positive.new(Negative.new(Negative.new(3))).next_step.to_s.should eq "(+(+3))"
      Positive.new(Negative.new(Addition.new(1, 2, 3, 4))).next_step.to_s.should eq "(+(-10))"
      Positive.new(Addition.new(1,2,3,4)).next_step.to_s.should eq "(+10)"
    end
  end
end