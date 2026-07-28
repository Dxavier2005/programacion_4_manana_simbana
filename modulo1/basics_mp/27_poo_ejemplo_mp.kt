// El constructor primario integra la declaración de propiedades
class Asistente(val nombre: String, val edad: Int)

// Con cuerpo adicional
class Asistente2(val nombre: String, val edad: Int) {
    fun presentarse() = "Soy $nombre y asisto a la conferencia, tengo $edad años"
    fun esMayorDeEdad() = edad >= 18
}

fun main() {
    val a = Asistente("Ana García", 28)
    println(a.nombre)   // Ana García
    println(a.edad)     // 28

    val a2 = Asistente2("Luis Pérez", 17)
    println(a2.presentarse())     // Soy Luis Pérez y asisto a la conferencia...
    println(a2.esMayorDeEdad())   // false
}