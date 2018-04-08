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
			for j in [0..grid.length - 1]
			do
				if i != j then
					var coordinatesNumber = grid[i].coordinates.length
					for k in [0..coordinatesNumber - 1]
					do
						if grid[i].coordinates[k] == grid[j].coordinates[k] or grid[i].coordinates[k] + 1 == grid[j].coordinates[k] or grid[i].coordinates[k] - 1 == grid[j].coordinates[k] then
							grid[i].neightboors[grid[i].neightboors.length] = grid[j]
							break
						end 
					end
				end
			end
		end
	end

	fun displayGrid do end
end