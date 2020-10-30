# ASCII Art TDD
# Raphael Adams

class AsciiArt
  def self.draw(number)
    output = ""
    (1..height(number)).each do |i|
      ((number - i).abs).times { output += " " }
      width_at_point(number, i).times { output += "* " }
      output += "\n"
    end
    output
  end

  def self.height(max_width)
    2 * max_width - 1
  end

  def self.width_at_point(max_width, distance_from_top)
    max_width - (max_width - distance_from_top).abs
  end
end
