class Sala(val ancho: Double, val alto: Double) {
    val capacidad: Double get() = ancho * alto
    val perimetro: Double get() = 2 * (ancho + alto)

    // Siempre llaman al constructor primario con this(...)
    constructor(lado: Double) : this(lado, lado)
    constructor(ancho: Int, alto: Int) : this(ancho.toDouble(), alto.toDouble())

    override fun toString() = "Sala(${ancho}x${alto}) | capacidad=${capacidad}"
}

fun main() {
    val s1 = Sala(5.0, 3.0)
    val s2 = Sala(4.0)        // sala cuadrada
    val s3 = Sala(6, 2)       // con Int

    println(s1)  // Sala(5.0x3.0) | capacidad=15.0
    println(s2)  // Sala(4.0x4.0) | capacidad=16.0
}