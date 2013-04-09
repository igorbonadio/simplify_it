module SimplifyIt
  class Negative
    def initialize(expression)
      @expression = expression
    end

    def to_negative
      @expression.eval.to_negative
    end

    def eval
      @expression.eval.to_negative
    end
  end
end

class Fixnum
  def to_negative
    -1 * self
  end

  def eval
    self
  end
end