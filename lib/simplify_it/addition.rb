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
      simplify_it = true
      Addition.new(*@expressions.map do |expr| 
        if simplify_it and not expr.simplified?
          simplify_it = false
          expr.to_positive 
        else
          expr
        end
      end.flatten)
    end

    def can_simplify?
      @expressions.each do |expr|
        return false unless expr.simplified?
      end
    end

    def simplified?
      false
    end

    def next_step
      if can_simplify?
        eval
      else
        next_step_expressions
      end
    end

    def next_step_expressions
      simplify_it = true
      Addition.new(*@expressions.map do |expr| 
        if simplify_it and not expr.simplified?
          simplify_it = false
          expr.next_step 
        else
          expr
        end
      end.flatten)
    end

    def to_negative
      Addition.new(*@expressions.map{ |i| Negative.new(i) })
    end

    def to_positive
      @expressions
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

    def <(num)
      false
    end

    def endpoint?
      false
    end
  end
end