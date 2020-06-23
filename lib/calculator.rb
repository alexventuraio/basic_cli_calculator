class Calculator
  attr_reader :result

  def initialize
    @result = 0.to_f
  end

  def add(amount)
    # validate if amount is a numeric value
    @result += amount
  end

  def subtract(amount)
    @result -= amount
  end

  def multiply(amount)
    @result *= amount
  end

  def divide(amount)
    @result /= amount
  end

  private

  def valid_number?(value)
    value.is_a? (Number)
  end
end
