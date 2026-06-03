fun main() {
    println("Map inmutable")

    val eventos = mapOf(
        "E001" to "Conferencia de Tecnología",
        "E002" to "Seminario de Negocios",
        "E003" to "Taller de Kotlin",
        "E004" to "Foro Académico"
    )

    println(eventos["E001"])
    println(eventos["E999"])
    println(eventos.getOrDefault("E001", "Desconocido"))
    println(eventos.getOrDefault("E999", "Desconocido"))

    println(eventos)
    println(eventos.keys)
    println(eventos.values)
    println(eventos.entries)

    for ((codigo, evento) in eventos) {
        println("$codigo - $evento")
    }

    println("Map Mutable")

    val inscripciones = mutableMapOf(
        "Conferencia IA" to 10,
        "Seminario Cloud" to 4,
        "Taller Kotlin" to 12,
        "Foro Tecnología" to 8
    )

    inscripciones["Congreso Nacional"] = 5
    println(inscripciones)

    inscripciones["Conferencia IA"] = 20
    println(inscripciones)

    inscripciones.remove("Foro Tecnología")
    println(inscripciones)

    inscripciones.getOrPut("Hackathon") { 15 }
    println(inscripciones)

    inscripciones.getOrPut("Taller Kotlin") { 15 }
    println(inscripciones)
}