module universe_cell
import cell
import universe_rule

class UniverseCell[E]
	super Cell[E]

	init
	do
		createRule
	end

	# Redef the rule for this class, we need neighbours within a radius of a one length square.
	redef protected fun createRule
	do
		rule = new UniverseRule(1)
	end
end
