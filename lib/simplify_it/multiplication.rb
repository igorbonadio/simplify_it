module SimplifyIt
  class Multiplication
    def initialize(*expressions) 
      @expressions = expressions
    end

    def eval
      @expressions.reduce(1) { |memo, i| memo * i.eval }
    end

    def next_step
      if can_simplify?
        if @expressions.length > 2
          Multiplication.new(*([@expressions[0].eval * @expressions[1].eval] + @expressions[2..-1]))
        else
          eval
        end
      else
        next_step_expressions
      end
    end

    def next_step_expressions
      simplify_it = true
      Multiplication.new(*@expressions.map do |expr| 
        if simplify_it and not expr.simplified?
          simplify_it = false
          expr.next_step 
        else
          expr
        end
      end.flatten)
    end

    def can_simplify?
      @expressions.each do |expr|
        return false unless expr.endpoint?
      end
      return true
    end

    def to_s
      expr = @expressions.reduce("") { |memo, i| memo + str(i) }
      "(#{expr[1..-1]})"
    end

    def <(num)
      false
    end

    def endpoint?
      false
    end

    def str(expression)
      expr = expression.to_s
      if expr[0] == '-'
        "*(#{expr})"
      else
        "*#{expr}"
      end
    end
  end
end