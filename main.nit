import gol_cellular_automaton
import universe_cellular_automaton

#if args.length == 3 then
#	var game = new CellularAutomaton(args[0].to_i, args[1].to_i, args[2].to_i, new Array[Array[Cell]])
#	game.start
#else
#	print "\nVeuillez rentrer trois arguments. Exemple : ./fichier_compile hauteur largeur nombre_de_generations\n"
#	print "Please, enter three arguments. Example : ./compiled_file height width number_of_generations\n"
#end

var dimensions = [50, 50]

#var ca = new GOLCellularAutomaton(dimensions, dimensions.length, 100, 1)
var ca = new UniverseCellularAutomaton(dimensions, dimensions.length, 500, 1,5)
ca.start
