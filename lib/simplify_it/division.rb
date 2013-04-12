module SimplifyIt
  class Division
    def initialize(num, div)
      @num = num
      @div = div
    end

    def eval
      Rational(@num, @div)
    end
  end
end