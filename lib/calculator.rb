class Calculator
  attr_reader :result

  def initialize
    @result = 0
  end

  def add(amount)
    # validate if amount is a numeric value
    @result += amount
  end
end
