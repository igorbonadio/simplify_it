module SimplifyIt
  class Negative
    def initialize(number)
      @number = number
    end

    def eval
      -1 * @number
    end
  end
end