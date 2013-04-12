require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module SimplifyIt
  describe Division do
    it "should divide 2 numbers" do
      Division.new(10,2).eval.should be == Rational(5)
      Division.new(50,20).eval.should be == Rational(5,2)
    end

    it "should divide negative numbers" do
      Division.new(Negative.new(10),2).eval.should be == Rational(-5)
      Division.new(10,Negative.new(2)).eval.should be == Rational(-5)
      Division.new(Negative.new(50),Negative.new(20)).eval.should be == Rational(5,2)
    end
  end
end