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
  end
end