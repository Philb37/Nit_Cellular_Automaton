module rule

abstract class Rule
	fun determineResultI(value: Int): Int do return 0

	fun determineResultS(value: String): String do return ""

	fun determineResultF(value: Float): Float do return 0.0

	fun determineResultB(value: Bool): Bool do return false
end