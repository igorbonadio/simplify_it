module SimplifyIt
  class Division
    def initialize(num, div)
      @num = num
      @div = div
    end

    def next_step
      if can_simplify?
        eval
      else
        next_step_expressions
      end
    end

    def can_simplify?
      @num.simplified? and @div.simplified?
    end

    def next_step_expressions
      unless @num.simplified?
        Division.new(@num.next_step, @div)
      else
        unless @div.simplified?
          Division.new(@num, @div.next_step)
        end
      end
    end

    def eval
      r = Rational(@num.eval, @div.eval)
      if r == r.ceil
        r.ceil
      else
        r
      end
    end

    def to_s
      div_str = @div.to_s
      num_str = @num.to_s
      if div_str[0] == "-"
        if num_str[0] == "-"
          "(#{num_str[1..-1]}/#{div_str[1..-1]})"
        else
          "(-#{num_str}/#{div_str[1..-1]})"
        end
      else
        "(#{num_str}/#{div_str})"
      end
    end
  end
end