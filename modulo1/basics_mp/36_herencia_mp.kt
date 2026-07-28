// Sin open — no se puede heredar (protección por defecto)
class Evento(val nombre: String)
// class Conferencia : Evento("Tech")  // ERROR — Evento es final

// Con open — la jerarquía está diseñada para ello
open class Evento(val nombre: String, val tipo: String) {
    // open — la subclase PUEDE sobreescribir
    open fun ejecutar() = println("$nombre inicia: $tipo")
    open fun descripcion() = "Evento: $nombre"

    // Sin open — la subclase NO puede sobreescribir
    fun abrirRegistro() = println("$nombre abre registro de asistentes")
}

// HERENCIA: Conferencia reutiliza todo de Evento y especializa ejecución
class Conferencia(nombre: String) : Evento(nombre, "Conferencia") {
    override fun ejecutar() {
        super.ejecutar()              // reutiliza la implementación del padre
        println("(se habilita la sala principal)")   // comportamiento propio
    }

    override fun descripcion() = "${super.descripcion()}, tipo conferencia"
}

class Taller(nombre: String, val practico: Boolean) : Evento(nombre, "Taller") {
    override fun descripcion() =
        "${super.descripcion()}, taller ${if (practico) "práctico" else "teórico"}"
}

fun main() {
    val conferencia = Conferencia("Tech Summit")
    conferencia.ejecutar()
    // Tech Summit inicia: Conferencia
    // (se habilita la sala principal)

    val taller = Taller("Kotlin Básico", true)
    println(taller.descripcion())  // Evento: Kotlin Básico, tipo conferencia, taller práctico

    // Herencia — Conferencia y Taller tienen todo lo de Evento más lo propio
    conferencia.abrirRegistro()  // Tech Summit abre registro de asistentes
}