fun main() {
    println("Controles de Flujo")
    println("Condicional If - else")

    println("¿Posee membresía VIP? s/n: ")
    val tieneMembresia = readLine()?.trim()?.lowercase() == "s"

    println("Costo de la entrada: ")
    val costoEntrada = readLine()?.toDoubleOrNull() ?: 0.0

    if (tieneMembresia) {
        val descuento = costoEntrada * 0.80
        println("Precio con descuento VIP = $${"%.2f".format(descuento)}")
    } else {
        println("Precio regular: $${"%.2f".format(costoEntrada)}")
    }
}