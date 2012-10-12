require 'debugger'

class Player
  def play_turn(warrior)
  	@health ||= warrior.health

	@startAtWall ||= warrior.feel(:backward).wall?
	#debugger

	if warrior.feel(:backward).wall?
		@startAtWall = true	
	end

	if !@startAtWall and !warrior.feel(:backward).wall?
		if warrior.feel(:backward).captive?
  			warrior.rescue!(:backward)
  		elsif !warrior.feel(:backward).empty?
  			warrior.pivot!
  		else
	  		warrior.walk!(:backward)
	  	end
  		return
  	end

  	if warrior.feel.captive?
  		warrior.rescue!
  		return
  	end


    if warrior.feel.empty?
    	if @health < 20 and @health <= warrior.health
    		warrior.rest!
    	else 
    		look_values = warrior.look.collect{|i| i.to_s}
    		if @health < 12 and @health > warrior.health
				warrior.walk!(:backward)
    		elsif look_values.include?("Wizard")
    			puts 'hit the break'
  				warrior.shoot!
  			elsif look_values.include?("Archer")
  				puts 'shoot the archer'
  				warrior.shoot!
  			elsif look_values.include?("Sludge")
  				puts 'shoot the sludge'
  				warrior.shoot!  			
    		else
    			warrior.walk!
    		end
    	end
	else
		warrior.attack!
	end
	@health = warrior.health

  end

  def equip_weapon(target)
  	case target
  		when "Wizard"
  			do shoot Wizard with bow
  		when "Archer"
  			do shoot archer with bow
  		else attack with sword
  	end
  end

  def observe()
  end

  def theatened(look_array)
  	look_array
  end

end
