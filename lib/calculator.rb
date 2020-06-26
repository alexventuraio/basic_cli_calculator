require_relative 'core_calculator'
require_relative 'calculator_view_helper'

class Calculator
  include CalculatorViewHelper

  def initialize
    @calc = CoreCalculator.new
  end

  def call
    render_view_welcome_msg
  end
end

Calculator.new.call
