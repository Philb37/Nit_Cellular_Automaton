module universe_cell
import cell
import universe_rule

class UniverseCell[E]
	super Cell[E]

	init
	do
		createRule
	end

	redef fun createRule
	do
		rule = new UniverseRule(1)
	end
end