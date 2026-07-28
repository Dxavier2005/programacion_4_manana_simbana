fun main() {
    println("Controles de Flujo When con condicionales arbitrarias")
    println("Escriba codigo")

    println("Edad del asistente")
    val edadAsistente = readLine()?.toIntOrNull() ?: 0

    println("¿Posee membresía?")
    val tieneMembresia = readLine()?.trim()?.lowercase() == "s"

    val nivelMembresia = if (tieneMembresia) {
        println("Nivel de membresía (BASICA/INTERMEDIA/PREMIUM)")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""

    val descuento = when {
        !tieneMembresia && edadAsistente < 18 -> 100.0
        !tieneMembresia && edadAsistente >= 65 -> 15.0
        !tieneMembresia -> 0.0
        nivelMembresia == "BASICA" -> 20.0
        nivelMembresia == "INTERMEDIA" -> 40.0
        nivelMembresia == "PREMIUM" -> 100.0
        else -> 10.0
    }

    println("Descuento aplicado: ${"%.2f".format(descuento)}%")
}