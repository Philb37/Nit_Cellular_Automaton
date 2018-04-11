module cell
import rule

abstract class Cell[E]

	var neighbours: Array[Cell[E]] is noinit
	var currentState: nullable E
	var nextState: nullable E
	var rule: nullable Rule
	var coordinates: Array[Int]

	init
	do
		neighbours = new Array[Cell[E]]
	end

	fun setCurrentState(state: E)
	do
		currentState = state
	end

	fun getCurrentState: E
	do
		return currentState
	end

	fun setNextState(state: E)
	do
		nextState = state
	end

	fun getNextState: E
	do
		return nextState
	end

	fun updateState
	do
		currentState = nextState
		#setCurrentState(getNextState)
	end

	fun createRule do end

	fun determineNextState do end
end
