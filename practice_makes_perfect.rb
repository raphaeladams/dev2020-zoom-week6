# Practice Makes Perfect
# Raphael Adams

def simulate_studying(subject)
  effectiveness = 0
  study_session_num = 0

  until effectiveness >= 10 do

    study_session_num += 1
    puts "Studying #{ subject }, session #{ study_session_num }!"
    effectiveness += yield study_session_num
    puts "Effectiveness so far: #{ effectiveness }"

  end

  puts "Ready for the #{ subject } exam, took #{  study_session_num } sessions.\n\n"
end

simulate_studying("math") do |sesh_num| 
  sesh_num < 3 ? 1 : sesh_num
end

simulate_studying("geography") do |sesh_num|
  [sesh_num, 2].min
end