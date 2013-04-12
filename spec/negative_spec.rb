require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Negative do
    it "should set a number to negative" do
      Negative.new(3).eval.should be == -3
    end

    it "should set a negative number to positve" do
      Negative.new(-3).eval.should be == 3
    end

    it "should set a negative number to positive" do
      Negative.new(Negative.new(3)).eval.should be == 3
    end

    it "should set an expression to negative" do
      Negative.new(Addition.new(1, 2, 3, 4)).eval.should be == -10
    end

    it "should set an expression to negative" do
      Negative.new(Addition.new(1, Negative.new(2), 3, 4)).eval.should be == -6
    end

    it "should have a string representation" do
      Negative.new(3).to_s.should eq "(-3)"
      Negative.new(-3).to_s.should eq "(-(-3))"
      Negative.new(Negative.new(3)).to_s.should eq "(-(-3))"
      Negative.new(Addition.new(1, 2, 3, 4)).to_s.should eq "(-(1+2+3+4))"
      Negative.new(Addition.new(1, 2, Multiplication.new(3,4,5), 4)).to_s.should eq "(-(1+2+(3*4*5)+4))"
      Negative.new(Multiplication.new(1,2,3)).to_s.should eq "(-(1*2*3))"
    end

    it "should show the next step of a solution" do
      Negative.new(3).next_step.to_s.should be == "-3"
      Negative.new(-3).next_step.to_s.should be == "3"
      Negative.new(Negative.new(3)).next_step.to_s.should eq "(+3)"
      Negative.new(Negative.new(Negative.new(3))).next_step.to_s.should eq "(-(+3))"
    end

    it "should show the next step of a solution of addition" do
      Negative.new(Addition.new(1, 2, 3, 4)).next_step.to_s.should eq "(-(3+3+4))"
      Negative.new(Negative.new(Addition.new(1, 2, 3, 4))).next_step.to_s.should eq "(-(-(3+3+4)))"
      Negative.new(Negative.new(Addition.new(1, 2, Negative.new(3), 4))).next_step.to_s.should eq "(-(-(1+2-3+4)))"
      Negative.new(Negative.new(Addition.new(1, 2, Negative.new(Addition.new(1,2,3,4)), 4))).next_step.to_s.should eq "(-(-(1+2+(-(3+3+4))+4)))"
    end

    it "should show the next step of a positive expression" do
      Negative.new(Positive.new(3)).next_step.to_s.should be == "(-3)"
      Negative.new(Positive.new(Negative.new(3))).next_step.to_s.should be == "(-(-3))"
    end

    it "should show the next step of a multiplication" do
      Negative.new(Multiplication.new(1,2,3)).next_step.to_s.should eq "(-(2*3))"
      Negative.new(Multiplication.new(1,Negative.new(2),3)).next_step.to_s.should eq "(-((-2)*3))"
    end
  end
end