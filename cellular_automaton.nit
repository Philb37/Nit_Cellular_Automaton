module cellular_automaton
import cell

abstract class CellularAutomaton

	var grid: Array[Cell[Int]] is noinit
	var dimensions: Array[Int]
	var dimension: Int
	var generation: Int
	var sleepTime: Int

	fun nextGeneration
	do
		for i in [0..grid.length - 1] do
			grid[i].determineNextState
		end

		displayGrid
		sleepTime.sleep

		#for i in [0..grid.length - 1] do
		#	grid[i].updateState
		#end
	end

	fun determineNeighbours
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

				if tchebychevDistance(points) <= grid[i].rule.neighboursRadius then
					grid[i].neighbours[grid[i].neighbours.length] = grid[j]
				end
			end
		end
	end

	fun tchebychevDistance(points: Array[Array[Int]]): Int
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

	fun start do end

	fun generateGrid do	end

	fun displayGrid do end
end
