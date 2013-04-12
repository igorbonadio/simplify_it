require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Division do
    it "should divide 2 numbers" do
      Division.new(10,2).eval.should be == Rational(5)
      Division.new(50,20).eval.should be == Rational(5,2)
    end
  end
end