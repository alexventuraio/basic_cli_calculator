module CalculatorViewHelper
  def render_view_welcome_msg
    puts "\n\n===== Running to Alexalc 1.0 =====\n"
  end

  def render_view_menu
    puts "\n\n"
    puts '  -----------------------  '
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
end
