module cellular_automaton
import cell

abstract class CellularAutomaton

	protected var grid: Array[Cell[Int]] is noinit
	protected var dimensions: Array[Int]
	protected var dimension: Int
	protected var generation: Int
	protected var sleepTime: Int

	protected fun nextGeneration
	do
		for i in [0..grid.length - 1] do
			grid[i].determineNextState
		end

		displayGrid
		sleepTime.sleep

		for i in [0..grid.length - 1] do
			grid[i].updateState
		end
	end

	protected fun determineNeighbours
	do
		for i in [0..grid.length - 1] do
			for j in [0..grid.length - 1] do
				var points = new Array[Array[Int]]
				points[0] = new Array[Int]
				points[1] = new Array[Int]

				var length = grid[i].coordinates.length
				for k in [0..length - 1] do
					points[0][k] = grid[i].coordinates[k]
					points[1][k] = grid[j].coordinates[k]
				end

				var distance = tchebychevDistance(points)

				if distance <= grid[i].rule.neighboursRadius and distance != 0 then
					grid[i].neighbours[grid[i].neighbours.length] = grid[j]
				end
			end
		end
	end

	private fun tchebychevDistance(points: Array[Array[Int]]): Int
	do
		var max = 0

		var length = points[0].length
		for i in [0..length - 1] do
			var temp = (points[0][i] - points[1][i]).abs

			if temp > max then
				max = temp
			end
		end

		return max
	end

	protected fun generateGrid do end

	protected fun displayGrid do end

	public fun start do end
end
