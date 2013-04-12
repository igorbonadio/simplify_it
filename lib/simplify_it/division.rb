module SimplifyIt
  class Division
    def initialize(num, div)
      @num = num
      @div = div
    end

    def eval
      Rational(@num.eval, @div.eval)
    end

    def to_s
      "(#{@num.to_s}/#{div_to_s})"
    end

    def div_to_s
      str = @div.to_s
      if str[0] == '-'
        "(#{str})"
      else
        str
      end
    end
  end
end