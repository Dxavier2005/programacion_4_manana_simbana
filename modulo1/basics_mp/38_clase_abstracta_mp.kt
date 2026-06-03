abstract class Evento(val nombre: String) {
    // abstract — las subclases DEBEN implementar esto (herencia forzada)
    abstract val capacidad: Double
    abstract val costo: Double
    abstract fun descripcion(): String

    // concreto — disponible en todas las subclases (reutilización)
    fun comparar(otro: Evento): String = when {
        capacidad > otro.capacidad -> "$nombre tiene más capacidad que ${otro.nombre}"
        capacidad < otro.capacidad -> "$nombre tiene menor capacidad que ${otro.nombre}"
        else -> "$nombre y ${otro.nombre} tienen la misma capacidad"
    }

    // Polimorfismo: toString usa capacidad y descripción que son polimórficas
    override fun toString() =
        "${descripcion()} | Capacidad: ${"%.2f".format(capacidad)}"
}

class Conferencia(val asistentes: Double) : Evento("Conferencia") {
    override val capacidad: Double get() = asistentes
    override val costo: Double get() = asistentes * 10
    override fun descripcion() = "Conferencia con $asistentes asistentes"
}

class Taller(val participantes: Double) : Evento("Taller") {
    override val capacidad: Double get() = participantes
    override val costo: Double get() = participantes * 8
    override fun descripcion() = "Taller con $participantes participantes"
}

class Seminario(val cupos: Double) : Evento("Seminario") {
    override val capacidad: Double get() = cupos
    override val costo: Double get() = cupos * 12
    override fun descripcion() = "Seminario con $cupos cupos disponibles"
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier Evento
    val eventos: List<Evento> = listOf(
        Conferencia(150.0),
        Taller(40.0),
        Seminario(80.0)
    )

    eventos.forEach { println(it) }  // toString polimórfico

    val mayor = eventos.maxByOrNull { it.capacidad }
    println("\nEvento con mayor capacidad: ${mayor?.nombre}")

    println(eventos[0].comparar(eventos[1]))
}