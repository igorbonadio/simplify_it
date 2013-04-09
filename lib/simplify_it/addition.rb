module SimplifyIt
  class Addition
    def initialize(*expressions)
      @expressions = expressions
    end

    def eval
      @expressions.reduce(0) { |memo, i| memo + i}
    end
  end
end