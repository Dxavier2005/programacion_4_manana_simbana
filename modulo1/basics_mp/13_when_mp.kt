fun main() {
    println("Controles de Flujo When")

    println("Escriba código del evento:")
    val codigo = readLine()?.toIntOrNull() ?: 0

    val tipoEvento = when (codigo) {
        1 -> "Conferencia de Tecnología"
        2 -> "Seminario de Negocios"
        3 -> "Taller de Programación"
        4 -> "Congreso Académico"
        5 -> "Foro Empresarial"
        6 -> "Charla de Innovación"
        else -> "Evento no registrado en el sistema"
    }

    println("Tipo de evento: $tipoEvento")
}