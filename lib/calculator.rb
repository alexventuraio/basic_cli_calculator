require_relative 'core_calculator'
require_relative 'calculator_view_helper'

class Calculator
  include CalculatorViewHelper

  def initialize
    @calc = CoreCalculator.new
    @next_value = ''
    @display_value = @calc.result
  end

  def call
    render_view_welcome_msg
    render_view_menu(@calc.result)
    keep_alive
  end

  def keep_alive
    while entry = get_user_input
      entry.downcase!

      case
      when is_a_number?(entry)
        process_number(entry)
      when entry.eql?('c')
        @calc.reset
      when entry.eql?('q')
        render_view_quit
        break
      else
        render_view_exception("Unknown command: '#{entry}'")
      end

      render_view_menu(@display_value)
    end
  end

  private

  def process_number(entry)
    # Make sure to cast entries like '+5' into '5'
    entry.sub!('+', '')
    # Make sure not to have string like '33-1' as a whole
    valid_group = Float(@next_value + entry) rescue nil

    if valid_group
      @next_value << entry
    else
      # Raise an exception
      render_view_exception('Wrong numeric format!')
    end

    @display_value = @next_value
  end

  def is_a_number?(value)
    value =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
  end

  def get_user_input
    gets.chomp
  end
end

Calculator.new.call
