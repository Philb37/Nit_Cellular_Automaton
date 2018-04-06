module cell

abstract class Cell[E]
	
	var currentState: nullable E
	var nextState: nullable E
	var coordinates: Array[Int]
	var neightboors: Array[Cell] is noinit

	fun determinateNextState do end

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
end