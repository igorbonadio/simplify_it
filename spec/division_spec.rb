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

    it "should divide negative and positive numbers" do
      Division.new(Negative.new(10),Positive.new(2)).eval.should be == Rational(-5)
      Division.new(Positive.new(10),Negative.new(2)).eval.should be == Rational(-5)
      Division.new(Positive.new(50),Positive.new(20)).eval.should be == Rational(5,2)
    end

    it "should divide complex expressions" do
      Division.new(Addition.new(1,2,3,4),2).eval.should be == Rational(5)
      Division.new(10,Addition.new(Negative.new(1), Negative.new(1))).eval.should be == Rational(-5)
    end

    it "should have a string representation" do
      Division.new(10,2).to_s.should be == "(10/2)"
      Division.new(-10,2).to_s.should be == "(-10/2)"
      Division.new(Negative.new(10),2).to_s.should be == "((-10)/2)"
      Division.new(10,Negative.new(2)).to_s.should be == "(10/(-2))"
      Division.new(10,-2).to_s.should be == "(-10/2)"
      Division.new(Negative.new(50),Negative.new(20)).to_s.should be == "((-50)/(-20))"
      Division.new(Negative.new(10),Positive.new(2)).to_s.should be == "((-10)/(+2))"
      Division.new(Addition.new(1,2,3,4),2).to_s.should be == "((1+2+3+4)/2)"
      Division.new(10,Addition.new(Negative.new(1), Negative.new(1))).to_s.should be == "(10/((-1)+(-1)))"
    end

    it "should show the next step of simple divisions" do
      Division.new(10,2).next_step.to_s.should be == "5"
      Division.new(-10,2).next_step.to_s.should be == "-5"
      Division.new(Negative.new(10),2).next_step.to_s.should be == "(-10/2)"
      Division.new(10,Negative.new(2)).next_step.to_s.should be == "(-10/2)"
    end
  end
end