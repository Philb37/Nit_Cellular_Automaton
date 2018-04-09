module cellular_automaton
import cell

abstract class CellularAutomaton

	var grid: Array[Cell[Int]] is noinit
	var dimensions: Array[Int]
	var dimension: Int
	var generation: Int
	var sleepTime: Int

	fun start do end

	fun nextGeneration
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

	fun generateGrid do	end

	fun determineNeightboors
	do
		for i in [0..grid.length - 1]
		do
			var voisins = 0
			for j in [0..grid.length - 1]
			do
				var coordinatesNumber = grid[i].coordinates.length
				var result = 0
 				for k in [0..coordinatesNumber - 1]
				do
					if result == coordinatesNumber
					then
						result += 1
					else
						result += (grid[i].coordinates[k] - grid[j].coordinates[k]).abs
					end
					if k == coordinatesNumber - 1 and (grid[i].coordinates[k] - grid[j].coordinates[k]).abs > 1
					then
						result += 1
					end
				end
				if result <= coordinatesNumber and result != 0 then
					voisins += 1
					grid[i].neightboors[grid[i].neightboors.length] = grid[j]
				end
			end
		end
	end

	fun displayGrid do end
end
