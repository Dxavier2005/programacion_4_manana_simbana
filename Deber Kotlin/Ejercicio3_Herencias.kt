open class Vehiculo(
    val marca: String,
    val modelo: String,
    val anio: Int
) {
    open fun mostrarDatos() {
        println("$marca $modelo $anio")
    }
}

class Auto(
    marca: String,
    modelo: String,
    anio: Int,
    val puertas: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrarDatos() {
        println("Auto: $marca $modelo $anio")
        println("Puertas: $puertas")
    }
}

class Motocicleta(
    marca: String,
    modelo: String,
    anio: Int,
    val cilindrada: Int
) : Vehiculo(marca, modelo, anio) {

    override fun mostrarDatos() {
        println("Motocicleta: $marca $modelo $anio")
        println("Cilindrada: $cilindrada cc")
    }
}

fun main() {
    val auto = Auto("Toyota", "Corolla", 2024, 4)
    val moto = Motocicleta("Yamaha", "R15", 2023, 150)

    auto.mostrarDatos()
    println()
    moto.mostrarDatos()
}