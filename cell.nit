module cell
import rule

# This class is a generic class which should be part of the grid in the "CellularAutomaton" class.
# A Cell as a rule which will define her behavior inside the function "determineNextState".
# It is also composed of a "currentState", and a "nextState", those will be updated with the "determineNextState" function on the "CellularAutomaton" class.
# It contains her neighbours which are determined on the "CellularAutomaton" class.
# You can't instantiate this class since it is abstract so don't forget to inherit from it.
abstract class Cell[E]
	
	# Array containing all the cell's neighbours.
	public var neighbours: Array[Cell[E]] is noinit
	private var currentState: E
	private var nextState: E
	public var rule: nullable Rule is noinit

	# Cell's coordinates in the n dimensions space.
	public var coordinates: Array[Int]

	init
	do
		neighbours = new Array[Cell[E]]
	end

	# currentState Setter.
	public fun setCurrentState(state: E)
	do
		currentState = state
	end

	# currentState Getter.
	public fun getCurrentState: E
	do
		return currentState
	end

	# nextState Setter.
	public fun setNextState(state: E)
	do
		nextState = state
	end

	# nextState Getter.
	public fun getNextState: E
	do
		return nextState
	end

	# Updating currentState from nextState value.
	public fun updateState
	do
		setCurrentState(getNextState)
	end

	# Instanciation method for the cell's rule.
	protected fun createRule do end

	# Method to determine the nextState of the cell.
	public fun determineNextState do end

end
