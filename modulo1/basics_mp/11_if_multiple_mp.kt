fun main() {
    println("Controles de Flujo")
    println("Condicional If - Multiples condiciones")

    println("Cantidad de asistentes registrados:")
    val asistentes = readLine()?.toIntOrNull() ?: 0

    val clasificacion = if (asistentes <= 50) {
        "Evento Pequeño"
    } else if (asistentes <= 100) {
        "Evento Mediano"
    } else if (asistentes <= 200) {
        "Evento Grande"
    } else if (asistentes <= 500) {
        "Conferencia Regional"
    } else if (asistentes <= 1000) {
        "Conferencia Nacional"
    } else {
        "Conferencia Internacional"
    }

    println("Clasificacion: $clasificacion")
}