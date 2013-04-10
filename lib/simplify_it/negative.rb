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

    def to_s
      "(-" + @expression.to_s + ")"
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

  alias_method :old_to_s, :to_s
  def to_s
    if self >= 0
      self.old_to_s
    else
      "(" + self.old_to_s + ")"
    end
  end
end