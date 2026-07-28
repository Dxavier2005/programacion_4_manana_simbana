fun main() {
    println("Operadores Lógicos")

    val tieneEntrada = true
    val estaRegistrado = false
    val eventoActivo = true

    println("&& - And Lógico")
    println("$tieneEntrada && $estaRegistrado = ${tieneEntrada && estaRegistrado}")
    println("$eventoActivo && $tieneEntrada = ${eventoActivo && tieneEntrada}")

    println("|| - Or Lógico")
    println("$tieneEntrada || $estaRegistrado = ${tieneEntrada || estaRegistrado}")
    println("$eventoActivo || $tieneEntrada = ${eventoActivo || tieneEntrada}")

    println("! - Not")
    println("! $tieneEntrada = ${!tieneEntrada}")
    println("! $eventoActivo = ${!eventoActivo}")
}