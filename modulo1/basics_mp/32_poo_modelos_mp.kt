data class Evento(
    val id: Int,
    val nombre: String,
    val costo: Double,
    val categoria: String,
    val activo: Boolean = true
)

fun main() {
    val e1 = Evento(1, "Conferencia IA", 89.99, "Tecnología")
    val e2 = Evento(1, "Conferencia IA", 89.99, "Tecnología")
    val e3 = Evento(2, "Seminario Cloud", 349.99, "Infraestructura")

    // toString() automático
    println(e1)  // Evento(id=1, nombre=Conferencia IA, ...)

    // equals() por valor
    println(e1 == e2)   // true
    println(e1 == e3)   // false

    // copy() — nuevo objeto con cambios puntuales
    val barato = e1.copy(costo = 59.99)
    val inactivo = e1.copy(activo = false)

    // Desestructuración
    val (id, nombre, costo) = e1
    println("$id: $nombre — $$costo")

    // En bucles
    listOf(e1, e3).forEach { (id2, nombre2, costo2) ->
        println("[$id2] $nombre2: $$costo2")
    }
}