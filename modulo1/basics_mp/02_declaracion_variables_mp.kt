fun main() {
    // No Mutable
    val nombreEvento = "Conferencia de Tecnología"
    val asistentes: Int = 28
    val costoEntrada = 3.14159

    // Mutables
    var inscritos = 0
    inscritos = inscritos + 1
    println(inscritos)
    inscritos = inscritos - 1
    println(inscritos)

    println("$nombreEvento tiene $asistentes asistentes registrados")
}
