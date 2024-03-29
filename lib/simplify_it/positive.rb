module SimplifyIt
  class Positive
    def initialize(expression)
      @expression = expression
    end

    def eval
      @expression.eval
    end

    def next_step
      if @expression.endpoint?
        simplify
      else
        Positive.new(@expression.next_step)
      end
    end

    def simplify
      @expression
    end

    def simplified?
      false
    end

    def to_negative
      Negative.new(@expression)
    end

    def to_s
      "(+#{str(@expression)})"
    end

    def str(expression)
      expr = expression.to_s
      if expr[0] == '-'
        "(#{expr})"
      else
        expr
      end
    end

    def endpoint?
      @expression.instance_of? Fixnum
    end

    def <(num)
      false
    end
  end
end