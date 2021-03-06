module CalculatorViewHelper
  def render_view_welcome_msg
    return if @silent_mode

    puts "\n\n===== Running to Alexalc 1.0 =====\n"
  end

  def render_view_menu(value)
    return if @silent_mode

    puts "\n\n"
    puts '  -----------------------  '
    puts "  #{value.to_s}"
    puts '  -----------------------  '
    puts '                           '
    puts '  +---------+ +---------+  '
    puts '  |    C    | |    Q    |  '
    puts '  +---------+ +---------+  '
    puts '  +---+ +---+ +---+ +---+  '
    puts '  | 7 | | 8 | | 9 | | / |  '
    puts '  +---+ +---+ +---+ +---+  '
    puts '  | 4 | | 5 | | 6 | | * |  '
    puts '  +---+ +---+ +---+ +---+  '
    puts '  | 1 | | 2 | | 3 | | - |  '
    puts '  +---+ +---+ +---+ +---+  '
    puts '  | 0 | | . | | = | | + |  '
    puts '  +---+ +---+ +---+ +---+  '
    print "\n\n> "
  end

  def render_view_quit(final_result)
    if @silent_mode
      puts final_result
    else
      puts "\n\n===== Stopping... =====\n"
    end
  end

  def render_view_exception(error_msg)
    if @silent_mode
      puts error_msg
    else
      puts "\n********** Error: #{error_msg} **********"
    end
  end
end
