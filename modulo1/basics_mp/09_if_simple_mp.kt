fun main() {
    println("Controles de Flujo")
    println("Condicional if")

    println("Ingrese la cantidad de asistentes registrados:")
    val asistentes = readLine()?.toIntOrNull() ?: 50

    if (asistentes >= 100) {
        println("Alta asistencia detectada: habilitar sala principal")
    }

    if (asistentes >= 200) {
        println("Asistencia masiva: habilitar salas adicionales")
    }

    println("Asistentes registrados: $asistentes")
}