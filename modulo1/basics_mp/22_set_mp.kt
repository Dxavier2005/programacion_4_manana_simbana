fun main() {
    println("Set")

    val asistentes = setOf(1, 2, 3, 4, 1, 3)
    println("asistentes set: ${asistentes}")

    println("Operaciones de conjuntos")

    val registrados = setOf(2, 4, 6, 8, 10)
    val confirmados = setOf(3, 6, 9, 12)

    println("registrados set: ${registrados}")
    println("confirmados set: ${confirmados}")

    println("union: ${registrados union confirmados}")
    println("intersección: ${registrados intersect confirmados}")
    println("substracción: ${registrados subtract confirmados}")

    println("registrados set: ${registrados}")
    println("confirmados set: ${confirmados}")

    println("Set mutable")

    val inscripciones = mutableSetOf("Kotlin Conference", "Java Summit", "React Native Day")

    println(inscripciones)

    inscripciones.add("Kotlin")
    println(inscripciones)

    inscripciones.add("JavaScript Conference")
    println(inscripciones)

    inscripciones.remove("Java Summit")
    println(inscripciones)

    println("Verificar si elemento existe ${"Kotlin" in inscripciones}")
    println("Verificar si elemento existe ${"Java" in inscripciones}")
}