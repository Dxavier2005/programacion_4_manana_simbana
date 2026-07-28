enum class EstadoEvento(val descripcion: String, val esTerminal: Boolean) {
    PENDIENTE  ("Esperando confirmación del evento", false),
    EN_PROCESO ("Evento en ejecución",               false),
    COMPLETADO ("Evento finalizado con éxito",       true),
    FALLIDO    ("Evento cancelado por error",        true),
    CANCELADO  ("Evento cancelado por el organizador", true);

    fun puedeTransicionarA(siguiente: EstadoEvento): Boolean = when (this) {
        PENDIENTE  -> siguiente == EN_PROCESO || siguiente == CANCELADO
        EN_PROCESO -> siguiente == COMPLETADO || siguiente == FALLIDO
        else       -> false
    }
}

fun main() {
    val estado = EstadoEvento.EN_PROCESO
    println(estado.descripcion)  // Evento en ejecución
    println(estado.esTerminal)    // false

    // when exhaustivo — sin else porque el compilador conoce todos los casos
    val icono = when (estado) {
        EstadoEvento.PENDIENTE   -> "⏰"
        EstadoEvento.EN_PROCESO  -> "⏳"
        EstadoEvento.COMPLETADO  -> "✅"
        EstadoEvento.FALLIDO     -> "❌"
        EstadoEvento.CANCELADO   -> "🚫"
    }

    println(icono)  // ⏳

    println(estado.puedeTransicionarA(EstadoEvento.COMPLETADO))  // true
}