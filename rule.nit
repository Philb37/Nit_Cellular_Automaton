module rule

abstract class Rule
	fun determineResult(value: Int): Int do return 0

	#fun determineResult(value: String): String do return null

	#fun determineResult(value: Float): Float do return 0.0

	#fun determineResult(value: Bool): Bool do return false
end