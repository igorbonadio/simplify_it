require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Addition do
    it "should add numbers" do
      Addition.new(1,2,3,4).eval.should be == 10
    end

    it "should add negative numbers" do
      Addition.new(Negative.new(1), Negative.new(2), Negative.new(3), Negative.new(4)).eval.should be == -10
    end

    it "should add negative and positive numbers" do
      Addition.new(1, Negative.new(2), Negative.new(3), 4).eval.should be == 0
    end

    it "should have a string representation" do
      Addition.new(1,2,3,4).to_s.should eq "(1+2+3+4)"
      Addition.new(1,2,-3,4).to_s.should eq "(1+2-3+4)"
      Addition.new(-1,-2,-3,-4).to_s.should eq "(-1-2-3-4)"
      Addition.new(Negative.new(1), Negative.new(2), Negative.new(3), Negative.new(4)).to_s.should eq "((-1)+(-2)+(-3)+(-4))"
      Addition.new(1, Negative.new(2), Negative.new(3), 4).to_s.should eq "(1+(-2)+(-3)+4)"
      Addition.new(1, 2, Addition.new(1, 2, 3, 4), 3, 4).to_s.should eq "(1+2+(1+2+3+4)+3+4)"
      Addition.new(1, 2, Addition.new(1, 2, Negative.new(3), 4), 3, 4).to_s.should eq "(1+2+(1+2+(-3)+4)+3+4)"
      Addition.new(1,2,Positive.new(3),4).to_s.should eq "(1+2+(+3)+4)"
      Addition.new(1,2,Positive.new(Multiplication.new(3,4,5)),4).to_s.should eq "(1+2+(+(3*4*5))+4)"
    end

    it "should show the next step of expressions" do
      Addition.new(1,2).next_step.to_s.should eq "3"
      Addition.new(1,2,3,4).next_step.to_s.should eq "(3+3+4)"
      Addition.new(1,2,-3,4).next_step.to_s.should eq "(3-3+4)"
      Addition.new(-1,-2,-3,-4).next_step.to_s.should eq "(-3-3-4)"
    end


    it "should show the next step of negative expressions" do
      Addition.new(Negative.new(1), Negative.new(2), Negative.new(3), Negative.new(4)).next_step.to_s.should eq "(-1+(-2)+(-3)+(-4))"
      Addition.new(1, Negative.new(2), Negative.new(3), 4).next_step.to_s.should eq "(1-2+(-3)+4)"
    end

    it "should show the next step of positive expressions" do
      Addition.new(1,2,Positive.new(3),4).next_step.to_s.should eq "(1+2+3+4)"
    end

    it "should show the next step of additions of additions" do
      Addition.new(1, 2, Addition.new(1, 2, 3, 4), 3, 4).next_step.to_s.should eq "(1+2+(3+3+4)+3+4)"
      Addition.new(1, 2, Addition.new(1, 2, Negative.new(3), 4), 3, 4).next_step.to_s.should eq "(1+2+(1+2-3+4)+3+4)"
    end

    it "should show the next step of only one sub expression" do
      Addition.new(1, 2, Addition.new(1, 2, 3, 4), 3, Addition.new(1, 2, 3, 4)).next_step.to_s.should eq "(1+2+(3+3+4)+3+(1+2+3+4))"
    end

    it "should show the next step of multiplications" do
      Addition.new(Multiplication.new(1,2,3,4),2,3,4).next_step.to_s.should eq "((2*3*4)+2+3+4)"
      Addition.new(1,Multiplication.new(1,2,3,4),3,4).next_step.to_s.should eq "(1+(2*3*4)+3+4)"
    end

    it "should simplify sum of rationals step by step"
  end
end