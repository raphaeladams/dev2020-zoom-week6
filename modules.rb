# OOPsie Project
# Raphael Adams

module GetsDressed
  def clothes
    @clothes ||= []
  end

  def add_clothes(article)
    clothes << article
  end
end

module DoesTricks
  def barrel_roll
    puts "Does a barrel roll!"
  end

  def somersault
    puts "Does a somersault!"
  end
end

module WakingAndSleeping
  def wake_up
    puts "Wakes up and opens eyes O_O"
  end

  def fall_asleep
    puts "Falling asleep... zzzzz ^.^"
  end
end