module SimplifyIt
  class Positive
    def initialize(expression)
      @expression = expression
    end

    def eval
      @expression.eval
    end
  end
end