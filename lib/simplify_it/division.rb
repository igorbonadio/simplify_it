module SimplifyIt
  class Division
    def initialize(num, div)
      @num = num
      @div = div
    end

    def <(n)
      false
    end

    def endpoint?
      @num.instance_of? Fixnum and @div.instance_of? Fixnum
    end

    def simplified?
      false
    end

    def next_step
      if can_simplify?
        eval
      else
        next_step_expressions
      end
    end

    def can_simplify?
      @num.simplified? and @div.simplified?
    end

    def next_step_expressions
      unless @num.simplified?
        Division.new(@num.next_step, @div)
      else
        unless @div.simplified?
          Division.new(@num, @div.next_step)
        end
      end
    end

    def eval
      r = Rational(@num.eval, @div.eval)
      if r == r.ceil
        r.ceil
      else
        r
      end
    end

    def to_negative
      Division.new(-1*@num, @div)
    end

    def to_s
      div_str = @div.to_s
      num_str = @num.to_s
      if div_str[0] == "-"
        if num_str[0] == "-"
          "(#{num_str[1..-1]}/#{div_str[1..-1]})"
        else
          "(-#{num_str}/#{div_str[1..-1]})"
        end
      else
        "(#{num_str}/#{div_str})"
      end
    end
  end
end

class Rational
  def endpoint?
    true
  end

  def to_negative
    self * -1
  end

  def mul(num)
    SimplifyIt::Division.new(SimplifyIt::Multiplication.new(self.numerator, num.numerator), 
                             SimplifyIt::Multiplication.new(self.denominator,num.denominator))
  end

  def add(num)
    div = mmc(self.denominator,num.denominator)
    SimplifyIt::Division.new(SimplifyIt::Addition.new((SimplifyIt::Multiplication.new(self.numerator,(div/self.denominator))), 
                                                      (SimplifyIt::Multiplication.new(num.numerator,(div/num.denominator))), ), 
                             div)
  end

  def mmc(a, b)
    a*(b/mdc(a,b))
  end

  def mdc(a, b)
    if b == 0
      return a
    else
      mdc(b, a%b)
    end
  end

  def simplified?
    true
  end

  def eval
    self
  end
end