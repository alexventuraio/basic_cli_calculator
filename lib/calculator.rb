require_relative 'core_calculator'
require_relative 'calculator_view_helper'

class Calculator
  include CalculatorViewHelper

  def initialize
    @calc = CoreCalculator.new
  end

  def call
    render_view_welcome_msg
    render_view_menu
    keep_alive
  end

  def keep_alive
    while entry = get_user_input
      entry.downcase!

      case
      when entry.eql?('c')
        @calc.reset
      when entry.eql?('q')
        render_view_quit
        break
      else
        render_view_exception("Unknown command: '#{entry}'")
      end
    end
  end

  private

  def get_user_input
    gets.chomp
  end
end

Calculator.new.call
