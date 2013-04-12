module SimplifyIt
  class Negative
    def initialize(expression)
      if expression < 0
        Negative.new(expression.to_negative)
      end
      @expression = expression
    end

    def next_step
      if @expression.endpoint?
        @expression.to_negative
      else
        Negative.new(@expression.next_step)
      end
    end

    def eval
      -1 * @expression.eval
    end

    def simplified?
      false
    end

    def endpoint?
      @expression.instance_of? Fixnum
    end

    def to_negative
      Positive.new(@expression)
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

    def <(num)
      false
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

  def simplified?
    true
  end

  def endpoint?
    true
  end
end