module space_ship
import life_form

class SpaceShip[E : LifeForm]
	var lifeForm: E
	var ressources: Int

	fun calculateRessources
	do
		#TODO
	end

	fun addNewUnit(unit: E)
	do
		#TODO
	end

	fun getUnit(x: Int, y: Int): E
	do
		#TODO
		return lifeForm
	end
end
