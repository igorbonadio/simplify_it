module SimplifyIt
  class Addition
    def initialize(*expressions)
      @expressions = expressions
    end

    def eval
      @expressions.reduce(0) { |memo, i| memo + i.eval }
    end

    def simplify
      if can_simplify?
        eval
      else
        simplify_expressions
      end
    end

    def simplify_expressions
      Addition.new(*@expressions.map { |expr| expr.simplify })
    end

    def can_simplify?
      @expressions.each do |expr|
        return false unless expr.simplified?
      end
    end

    def simplified?
      false
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