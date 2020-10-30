# ASCII Art TDD
# Raphael Adams

class AsciiArt
  def self.draw(number)
    output = ""
    (1..number).each do |i|
      (number - i).times { output += " " }
      i.times { output += "*" }
      output += "\n"
    end
    output
  end
end