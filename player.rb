require 'debugger'

class Player
  attr_accessor :warrior, :observations

  def play_turn(warrior)
    @warrior = warrior
    puts "Threatened? - #{threatened?}"
    make_decision!
  end

  def observe
    forward = warrior.look(:forward).collect{|i| i.to_s}
    backward = warrior.look(:backward).collect{|i| i.to_s}
    observations = backward + forward
  end

  def threatened?
    observations = observe
    return true if observations.include?('Archer')
    return true if observations.slice(1, 4).include?('Wizard')
    return true if observations.slice(2, 2).any? {|o| o.index(/Sludge/)}
    return false
  end

  def make_decision!
    if !threatened? && warrior.health < 20
      heal!
    elsif wizard_infront?
      attack!
    elsif wizard_behind?
      change_direction!
    elsif archer_infront?
      puts "I detected an archer in front of me"
      attack!
    elsif archer_behind?
      puts "I detected an archer behind me and am turning around"
      change_direction!
    elsif sludge_infront?
      puts "I detected a sludge in front of me and am attacking!!!!"
      attack!
    elsif sludge_behind?
      change_direction!
    else 
      puts "I am moving foward!!"
      move!
    end
  end

  def wizard_infront?
    observations = observe
    return true if observations.slice(3, 3).include?('Wizard')
    return false
  end

  def wizard_behind?
    observations = observe
    return true if observations.slice(0, 3).include?('Wizard')
    return false
  end

  def archer_infront?
    observations = observe
    return true if observations.slice(3, 3).include?('Archer')
    return false
  end

  def archer_behind?
    observations = observe
    return true if observations.slice(0, 3).include?('Archer')
    return false
  end

  def sludge_infront?
    observations = observe
    return true if observations.slice(3, 3).any? {|o| o.index(/Sludge/)}
    return false
  end

  def sludge_behind?
    observations = observe
    return true if observations.slice(0, 3).any? {|o| o.index(/Sludge/)}
    return false
  end

  def threat_priority
  end

  def change_direction!
    warrior.pivot!
  end

  def heal!
    puts "I'm healing because i'm not being attacked"
    warrior.rest!
  end

  def move!
    if warrior.feel.captive?
      warrior.rescue!
      return
    elsif warrior.feel.wall?
      change_direction!
      return
    elsif look_behind_for_hostage?
      change_direction!
    else warrior.walk!
    end
  end

  def look_behind_for_hostage?
    backward = warrior.look(:backward).collect{|i| i.to_s}
    if backward.include?('Captive')
      return true
    else return false
    end
  end

  def look_front_for_hostage?
    forward = warrior.look(:forward).collect{|i| i.to_s}
    if forward.include?('Captive')
      return true
    else return false
    end
  end

  def attack!
    if look_front_for_hostage?
      move!  
    else warrior.shoot!
    end 
  end


end
