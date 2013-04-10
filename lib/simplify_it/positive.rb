module SimplifyIt
  class Positive
    def initialize(expression)
      @expression = expression
    end

    def eval
      @expression.eval
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
  end
end