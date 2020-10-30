# OOPsie Project
# Raphael Adams

require_relative 'parent'
require_relative 'modules'

class EvolvedCreature1 < Creature
  attr_reader :att4

  def initialize(att1, att2, att3, att4)
    super
    @att4 = att4
    # add one more hash item
  end

  def extra_method1
  end

  def extra_method2
  end
end

class EvolvedCreature2 < Creature
  attr_reader :att4

  def initialize(att1, att2, att3, att4)
    super
    @att4 = att4
    # add one more hash item
  end

  def extra_method1
  end

  def extra_method2
  end
end

class EvolvedCreature3 < Creature
  attr_reader :att4

  def initialize(att1, att2, att3, att4)
    super
    @att4 = att4
    # add one more hash item
  end

  def extra_method1
  end

  def extra_method2
  end
end