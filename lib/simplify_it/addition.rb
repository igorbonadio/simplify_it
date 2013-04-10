module SimplifyIt
  class Addition
    def initialize(*expressions)
      @expressions = expressions
    end

    def eval
      @expressions.reduce(0) { |memo, i| memo + i.eval }
    end

    def simplify
      eval
    end

    def to_negative
      Addition.new(*@expressions.map{ |i| Negative.new(i) })
    end

    def to_s
      expr = @expressions.reduce("") { |memo, i| memo + str(i) }
      if expr[0] == "+"
        expr = expr[1..-1]
      end
      "(#{expr})"
    end

    def str(expression)
      expr = expression.to_s
      if expr[0] == '-'
        expr
      else
        "+#{expr}"
      end
    end
  end
end