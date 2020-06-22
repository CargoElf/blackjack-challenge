module StringExtenstions
  module Colors
    def red
      "\e[1;31m#{self}\e[0m"
    end

    def black
      "\e[30m#{self}\e[0m"
    end

    def cyan
      "\e[36m#{self}\e[0m"
    end

    def magenta
      "\e[35m#{self}\e[0m"
    end

    def white_background
      "\e[47m#{self}\e[0m"
    end
  end

  module StringEffects
    def blink
      "\e[5m#{self}\e[0m"
    end
  end
end

String.include StringExtenstions::Colors
String.include StringExtenstions::StringEffects
