require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Multiplication do
    it "should multiply number" do
      Multiplication.new(1,2,3).eval.should be == 6
    end

    it "should multiply negative expressions" do
      Multiplication.new(1,Negative.new(2),3).eval.should be == -6
      Multiplication.new(1,Negative.new(Negative.new(2)),3).eval.should be == 6
    end

    it "should multiply complex expressions" do
      Multiplication.new(1,Addition.new(2,1,3),3).eval.should be == 18
      Multiplication.new(1,Negative.new(Addition.new(1,2,3)),3).eval.should be == -18
    end

    it "should have a string representation" do
      Multiplication.new(1,2,3).to_s.should be == "(1*2*3)"
      Multiplication.new(1,-2,3).to_s.should be == "(1*(-2)*3)"
      Multiplication.new(1,Negative.new(2),3).to_s.should be == "(1*(-2)*3)"
      Multiplication.new(1,Negative.new(Negative.new(2)),3).to_s.should be == "(1*(-(-2))*3)"
      Multiplication.new(1,Addition.new(2,1,3),3).to_s.should be == "(1*(2+1+3)*3)"
      Multiplication.new(1,Negative.new(Addition.new(2,1,3)),3).to_s.should be == "(1*(-(2+1+3))*3)"
    end

    it "should show the next step of a solution" do
      Multiplication.new(1,2).next_step.to_s.should be == "2"
      Multiplication.new(1,2,3).next_step.to_s.should be == "(2*3)"
      Multiplication.new(1,-2,3).next_step.to_s.should be == "((-2)*3)"
      Multiplication.new(1,Negative.new(2),3).next_step.to_s.should be == "((-2)*3)"
      Multiplication.new(1,Negative.new(Negative.new(2)),3).next_step.to_s.should be == "(1*(+2)*3)"
      Multiplication.new(1,Addition.new(2,1,3),3).next_step.to_s.should be == "(1*(3+3)*3)"
      Multiplication.new(1,Negative.new(Addition.new(2,1,3)),3).next_step.to_s.should be == "(1*(-(3+3))*3)"
    end

    it "should multiply rationals step by step"
  end
end