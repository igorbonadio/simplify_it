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
  end
end