module SimplifyIt
  class Addition
    def initialize(*expressions)
      @expressions = expressions
    end

    def eval
      @expressions.reduce(0) { |memo, i| memo + i.eval }
    end

    def to_s
      "(" + @expressions.reduce("") { |memo, i| memo + i.to_s + "+" }[0..-2] + ")"
    end
  end
end