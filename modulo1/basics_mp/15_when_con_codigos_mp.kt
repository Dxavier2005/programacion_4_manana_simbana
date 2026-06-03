fun main() {
    println("Controles de Flujo When - con bloque de codigos")

    println("Nombre del Evento")
    val nombreEvento = readLine()?.trim()?.lowercase() ?: "Sin nombre"

    println("Nivel del Evento (INTERNACIONAL/NACIONAL/REGIONAL/LOCAL)")
    val nivel = readLine()?.trim()?.uppercase() ?: ""

    when (nivel) {
        "INTERNACIONAL" -> {
            println("EVENTO INTERNACIONAL: $nombreEvento")
            println("Confirmar participación de invitados extranjeros")
            println("Activar protocolo de traducción y logística internacional")
        }

        "NACIONAL" -> {
            println("EVENTO NACIONAL: $nombreEvento")
            println("Coordinar transporte de participantes")
            println("Verificar disponibilidad de auditorios")
        }

        "REGIONAL" -> println("Evento regional: $nombreEvento")

        "LOCAL" -> println("Evento local: $nombreEvento continuar con la planificación normal")

        else -> println("Nivel no reconocido")
    }
}