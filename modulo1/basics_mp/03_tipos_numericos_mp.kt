fun main() {
    // Tipos Datos
    // Números Enteros
    val capacidadSala: Byte = 127

    println("Capacidad Byte $capacidadSala")

    val asistentesRegistrados: Short = 32_765
    println("Asistentes Short $asistentesRegistrados")

    val totalParticipantes: Int = 2_147_483_647
    println("Participantes Int: $totalParticipantes")

    val presupuestoEvento: Long = 12_122_122_122_123_123L
    println("Presupuesto Long $presupuestoEvento")

    println("Numeros decimales")

    val costoEntrada: Float = 3.14f
    println("Costo Float $costoEntrada")

    val calificacionEvento: Double = 3.14159265
    println("Calificación Double $calificacionEvento")

    // Inferido
    val nombreEvento = "Conferencia Internacional de Tecnología"
    val duracionHoras = 56

    println("Nombre del evento: $nombreEvento")
    val nombreTipo = nombreEvento::class.simpleName
    println("Tipo inferido nombreEvento: $nombreTipo")

    println("Duración en horas: $duracionHoras")
    val duracionTipo = duracionHoras::class.simpleName
    println("Tipo inferido duracionHoras: $duracionTipo")
}