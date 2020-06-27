class CoreCalculator
  attr_reader :result

  def initialize
    @result = 0.to_f
  end

  def reset(value = 0.0)
    @result = value
  end

  def add(amount)
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

  def execute(operation, value)
    operation.downcase!

    case operation
    when 'add'
      add(value)
    when 'subtract'
      subtract(value)
    when 'multiply'
      multiply(value)
    when 'divide'
      divide(value)
    end
  end
end
