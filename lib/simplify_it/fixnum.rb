class Fixnum
  def eval
    self
  end

  def to_negative
    -1 * self
  end

  def simplified?
    true
  end

  def endpoint?
    true
  end

  def next_step
    raise Exception.new("It can not be simplified!")
  end

  def mul(num)
    self * num
  end
end