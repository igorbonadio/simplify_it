require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Multiplication do
    it "should multiply number" do
      Multiplication.new(1,2,3).eval.should be == 6
    end
  end
end