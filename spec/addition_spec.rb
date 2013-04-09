require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Addition do
    it "should add numbers" do
      addition = Addition.new(1,2,3,4)
      addition.eval.should be == 10
    end

    it "should add negative numbers" do
      addition = Addition.new(Negative.new(1), Negative.new(2), Negative.new(3), Negative.new(4))
      addition.eval.should be == -10
    end
  end
end