module SimplifyIt
  class Multiplication
    def initialize(*expressions) 
      @expressions = expressions
    end

    def eval
      @expressions.reduce(1) { |memo, i| memo * i.eval }
    end
  end
end