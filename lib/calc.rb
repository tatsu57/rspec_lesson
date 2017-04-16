class Calc

  attr_accessor :tax

  def initialize()
    @tax = 0
  end

  def add(a, b)
    a + b
  end

  def price(x)
    x * (1 + tax)
  end

  def add_name(a, b, name)
    (a + b).to_s + ' by ' + name
  end
end
