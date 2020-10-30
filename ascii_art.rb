# ASCII Art TDD
# Raphael Adams

class AsciiArt
  def self.draw(number)
    output = ""
    (0..number).each do |i|
      i.times { output += "*" }
      output += "\n"
    end
    output
  end
end