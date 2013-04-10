module SimplifyIt
  class Negative
    def initialize(expression)
      @expression = expression
    end

    def eval
      -1 * @expression.eval
    end

    def simplify
      @expression.to_negative
    end

    def to_s
      "(-#{str(@expression)})"
    end

    def str(expression)
      expr = expression.to_s
      if expr[0] == '-'
        "(#{expr})"
      else
        expr
      end
    end
  end
end

class Fixnum
  def eval
    self
  end

  def to_negative
    -1 * self
  end
end