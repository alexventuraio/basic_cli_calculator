require_relative 'core_calculator'
require_relative 'calculator_view_helper'

class Calculator
  include CalculatorViewHelper

  def initialize(silent_mode: false)
    @silent_mode = silent_mode
    @calc = CoreCalculator.new
    @operation = nil
    @next_value = ''
    @display_value = @calc.result
  end

  def call
    render_view_welcome_msg
    render_view_menu(@calc.result)
    start_listening_commands
  end

  def start_listening_commands
    while entry = get_user_input
      entry.downcase!

      case
      when is_a_number?(entry)
        process_number(entry)
      when entry.eql?('+')
        process_operation('add')
      when entry.eql?('-')
        process_operation('subtract')
      when entry.eql?('*')
        process_operation('multiply')
      when entry.eql?('/')
        process_operation('divide')
      when entry.eql?('=')
        execute_result
      when entry.eql?('c')
        @calc.reset
        @display_value = @calc.result
        @next_value = ''
      when entry.eql?('q')
        render_view_quit(@calc.result)
        break
      else
        render_view_exception("Unknown command: '#{entry}'")
      end

      render_view_menu(@display_value)
    end
  end

  private

  def execute_result
    @calc.execute(@operation, @next_value.to_f)
    @operation = nil
    @next_value = ''
    @display_value = @calc.result
  end

  def process_operation(operation_name)
    # When user clicks another operation instead of the '=' symbol
    # Perform any pending operation if exists before continuing
    execute_result if @operation

    unless @next_value.empty?
      @calc.reset(@next_value.to_f)
      @display_value = @next_value
      @next_value = ''
    end

    @operation = operation_name
  end

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
    $stdin.gets.chomp
  end
end
