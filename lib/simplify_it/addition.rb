module SimplifyIt
  class Addition
    def initialize(*expressions)
      @expressions = expressions
    end

    def eval
      @expressions.reduce(0) { |memo, i| memo + i.eval }
    end

    def to_s
      "(#{@expressions.reduce("") { |memo, i| memo + str(i) }[1..-1]})"
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