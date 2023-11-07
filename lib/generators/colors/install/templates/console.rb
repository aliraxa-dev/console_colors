module Console
  class Error < StandardError; end
  COLORS = {
      black: 30,
      red: 31,
      green: 32,
      yellow: 33,
      blue: 34,
      pink: 35,
      light_blue: 36,
      white: 37,
      light_grey: 90,
      dark: 40,
      alert: 41,
      success: 42,
      info: 43,
      primary: 44,
      warning: 45,
      help: 46,
      log: 47
    }.freeze

    COLORS.each do |color, code|
      define_singleton_method(color) do |text|
        puts "\e[#{code}m#{text}\e[0m"
      end
    end
end

Console.info('Terminal Colores are working!')
