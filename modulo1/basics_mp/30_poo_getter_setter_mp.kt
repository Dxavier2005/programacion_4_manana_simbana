class SalaEvento(capacidadInicial: Double) {

    // ENCAPSULAMIENTO: el setter valida antes de asignar
    var capacidad: Double = capacidadInicial
        set(value) {
            require(value >= 0) { "La capacidad no puede ser negativa" }
            field = value  // 'field' es el backing field
        }

    // ABSTRACCIÓN: el usuario consulta métricas sin saber el cálculo interno
    val capacidadMaxima: Double
        get() = capacidad * 1.0

    val capacidadDisponible: Double
        get() = capacidad

    val estado: String
        get() = when {
            capacidad < 50 -> "Sala pequeña"
            capacidad < 150 -> "Sala mediana"
            capacidad < 300 -> "Sala grande"
            capacidad < 500 -> "Auditorio"
            else -> "Centro de convenciones"
        }
}

fun main() {
    val sala = SalaEvento(120.0)

    println("Capacidad: ${sala.capacidad} asistentes")
    println("Estado: ${sala.estado}")

    sala.capacidad = 40.0
    println("${sala.capacidad} asistentes → ${sala.estado}")

    // sala.capacidad = -10.0  // IllegalArgumentException
}