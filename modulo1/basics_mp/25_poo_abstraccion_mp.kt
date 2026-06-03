// El usuario de esta clase solo sabe QUÉ puede hacer con un Evento
// No necesita saber cómo se calcula precioConIVA ni cómo funciona la disponibilidad

class Evento(
    val id: Int,
    val nombre: String,
    val costo: Double,
    private val cupos: Int      // privado — el usuario no manipula los cupos directamente
) {
    val costoConIva: Double     // interfaz pública — qué puede consultar
        get() = costo * 1.19

    val disponible: Boolean
        get() = cupos > 0

    override fun toString() = "$nombre ($${"%.2f".format(costo)})"
}

fun main() {
    val conferencia = Evento(1, "Conferencia de Tecnología", 89.99, 15)

    // El código externo usa la interfaz pública — no sabe el detalle interno
    println(conferencia.disponible)   // true
    println(conferencia.costoConIva)  // 106.99

    // conferencia.cupos = 0          // ERROR — privado, protegido por diseño
}