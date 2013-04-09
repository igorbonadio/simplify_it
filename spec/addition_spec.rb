require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Addition do
    it "should add numbers" do
      addition = Addition.new(1,2,3,4)
      addition.eval.should be == 10
    end
  end
end