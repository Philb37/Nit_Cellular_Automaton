module cell
import rule

abstract class Cell[E]

	var neightboors: Array[Cell[E]] is noinit
	var currentState: nullable E
	var nextState: nullable E
	var rule: nullable Rule
	var coordinates: Array[Int]

	init
	do
		neightboors = new Array[Cell[E]]
	end

	fun determineNextState do end

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
		setCurrentState(getNextState)
	end

	fun createRule do end
end
