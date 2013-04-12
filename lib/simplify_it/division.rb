module SimplifyIt
  class Division
    def initialize(num, div)
      @num = num
      @div = div
    end

    def eval
      Rational(@num.eval, @div.eval)
    end
  end
end