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
    end

    it "should simplify expressions" do
      Addition.new(1,2,3,4).simplify.to_s.should eq "10"
    end
  end
end