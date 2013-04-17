require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Language do
    it "should parse some expressions" do
      lang = Language.new
      lang.parse("10").should be_true
      lang.parse("-3").should be_true
    end
  end
end