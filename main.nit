import cell
import cellular_automaton
import human
import robot
import planetary_system
import space_ship
import star
import black_hole
import planet

if args.length == 3 then
	var game = new CellularAutomaton(args[0].to_i, args[1].to_i, args[2].to_i, new Array[Array[Cell]])
	game.start
else
	print "\nVeuillez rentrer trois arguments. Exemple : ./fichier_compile hauteur largeur nombre_de_generations\n"
	print "Please, enter three arguments. Example : ./compiled_file height width number_of_generations\n"
end
