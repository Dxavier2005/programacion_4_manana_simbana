fun main() {

    var totalAsistentes = 0
    var eventosConAltaAsistencia = 0

    repeat(6) { i ->
        println("Ingrese la cantidad de asistentes del evento ${i + 1}")
        var asistentes = readLine()?.toIntOrNull() ?: 0

        totalAsistentes += asistentes

        if (asistentes >= 100) {
            eventosConAltaAsistencia++
        }
    }

    var promedio = totalAsistentes / 6

    println("Promedio de asistentes: $promedio")
    println("Eventos con alta asistencia: $eventosConAltaAsistencia")

    if (eventosConAltaAsistencia > 2) {
        println("Alta asistencia sostenida")
    }
}