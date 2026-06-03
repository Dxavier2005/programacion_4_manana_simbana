fun main() {
    println("Controles de Flujo Iteraciones. Ciclos repetitivos - Ciclo Repeat")

    println("¿Cuántos eventos desea registrar?")
    val eventos = readLine()?.toIntOrNull() ?: 0

    var totalAsistentes = 0

    repeat(eventos) { i ->
        println("Cantidad de asistentes del evento ${i + 1}")
        val asistentes = readLine()?.toIntOrNull() ?: 0
        totalAsistentes += asistentes
    }

    val promedio = if (eventos > 0) totalAsistentes / eventos else 0

    println("Promedio de asistentes por evento: $promedio")

    println(
        "Clasificacion: ${
            when {
                promedio < 50 -> "Evento Pequeño"
                promedio <= 200 -> "Evento Mediano"
                else -> "Evento Grande"
            }
        }"
    )
}