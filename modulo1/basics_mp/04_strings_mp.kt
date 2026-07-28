fun main() {

    val nombreEvento = "Conferencia"
    val tema = "Tecnología"
    val asistentes = 28

    // Variable simple
    println("Bienvenido a $nombreEvento")

    // Expresión
    println("Evento Completo: ${nombreEvento.uppercase()} ${tema.uppercase()}")
    println("Asistentes proyectados: ${asistentes + 6}")

    // String Multilínea
    val tarjeta = """
        |Evento: $nombreEvento $tema
        |Asistentes: $asistentes
        |Acceso: ${if (asistentes >= 18) "Disponible" else "Limitado"}
    """.trimMargin()

    println(tarjeta)
}