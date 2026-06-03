fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo Repeat")

    println("¿Cuántos eventos desea evaluar?")
    val eventos = readLine()?.toIntOrNull() ?: 3

    var totalAsistentes = 0

    repeat(eventos) { i ->
        println("Evento ${i + 1} (cantidad de asistentes)")
        val asistentes = readLine()?.toIntOrNull() ?: 0
        totalAsistentes += asistentes
    }

    val promedio = if (eventos > 0) totalAsistentes / eventos else 0

    println("Promedio de asistentes: $promedio")

    println("Clasificacion: ${
        when {
            promedio < 50 -> "Evento Pequeño"
            promedio <= 100 -> "Evento Mediano"
            else -> "Evento Grande"
        }
    }")
}