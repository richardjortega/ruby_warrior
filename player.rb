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

  def observe
  end

  def threatened?
  	warrior looks in front
  	warrior look in back
  	if archer we are threatened
  	if wizard in any position except last we are threatened
  	if sludge in first position we are threatened
  	else heal yourself if less than max health
  end

  def can_move?
 	safe left move_direction
 	safe right move_direction
  end

  def move_direction

  end



end
