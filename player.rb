require 'debugger'

class Player
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
