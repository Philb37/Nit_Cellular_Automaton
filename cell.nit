module cell
import rule

abstract class Cell[E]

	public var neighbours: Array[Cell[E]] is noinit
	private var currentState: E
	private var nextState: E
	public var rule: nullable Rule is noinit
	public var coordinates: Array[Int]

	init
	do
		neighbours = new Array[Cell[E]]
	end

	public fun setCurrentState(state: E)
	do
		currentState = state
	end

	public fun getCurrentState: E
	do
		return currentState
	end

	public fun setNextState(state: E)
	do
		nextState = state
	end

	public fun getNextState: E
	do
		return nextState
	end

	public fun updateState
	do
		setCurrentState(getNextState)
	end

	protected fun createRule do end

	public fun determineNextState do end
end
