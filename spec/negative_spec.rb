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
    end

    it "should simplify an expression" do
      Negative.new(3).simplify.to_s.should eq "-3"
      Negative.new(-3).simplify.to_s.should eq "3"
      Negative.new(Negative.new(3)).simplify.to_s.should eq "(+3)"
      Negative.new(Negative.new(Negative.new(3))).simplify.to_s.should eq "(+(-3))"
    end

    it "should simplify additions" do
      Negative.new(Addition.new(1, 2, 3, 4)).simplify.to_s.should eq "((-1)+(-2)+(-3)+(-4))"
      Negative.new(Addition.new(1, Negative.new(2), Negative.new(3), 4)).simplify.to_s.should eq "((-1)+(-(-2))+(-(-3))+(-4))"
    end

    it "should show the next step of a solution" do
      Negative.new(3).next_step.to_s.should be == "-3"
      Negative.new(-3).next_step.to_s.should be == "3"
      Negative.new(Negative.new(3)).next_step.to_s.should eq "(+3)"
      Negative.new(Negative.new(Negative.new(3))).next_step.to_s.should eq "(-(+3))"
    end

    it "should show the next step of a solution of additions" do
      Negative.new(Addition.new(1, 2, 3, 4)).next_step.to_s.should eq "(-10)"
      Negative.new(Negative.new(Addition.new(1, 2, 3, 4))).next_step.to_s.should eq "(-(-10))"
      Negative.new(Negative.new(Addition.new(1, 2, Negative.new(3), 4))).next_step.to_s.should eq "(-(-(1+2-3+4)))"
      Negative.new(Negative.new(Addition.new(1, 2, Negative.new(Addition.new(1,2,3,4)), 4))).next_step.to_s.should eq "(-(-(1+2+(-10)+4)))"
    end
  end
end