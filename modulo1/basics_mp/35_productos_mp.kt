data class Categoria(val id: Int, val nombre: String)

data class Evento(
    val id:        Int,
    val nombre:    String,
    val costo:     Double,
    val cupos:     Int,
    val categoria: Categoria,
    val activo:    Boolean = true
) {
    // ABSTRACCIÓN: el usuario consulta disponible sin saber la lógica
    val disponible: Boolean get() = activo && cupos > 0
    val costoConIva: Double get() = costo * 1.19

    // Devuelve una copia — inmutabilidad como forma de encapsulamiento
    fun aplicarDescuento(porcentaje: Double): Evento {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(costo = costo * (1 - porcentaje / 100))
    }
}

// ENCAPSULAMIENTO: el estado del catálogo es privado y mutable internamente
object CatalogoEventos {
    private val categorias = mutableListOf(
        Categoria(1, "Tecnología"),
        Categoria(2, "Negocios"),
        Categoria(3, "Educación")
    )

    private val eventos = mutableListOf<Evento>()
    private var siguienteId = 1

    fun agregarEvento(nombre: String, costo: Double, cupos: Int, categoriaId: Int): Evento? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val evento = Evento(siguienteId++, nombre, costo, cupos, categoria)
        eventos.add(evento)
        return evento
    }

    // ABSTRACCIÓN: interfaz pública limpia — solo lectura de listas
    fun listar(): List<Evento> = eventos.toList()

    fun disponibles(): List<Evento> = eventos.filter { it.disponible }

    fun porCategoria(id: Int): List<Evento> =
        eventos.filter { it.categoria.id == id }

    fun buscar(query: String): List<Evento> =
        eventos.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoEventos.agregarEvento("Conferencia IA",      89.99, 15, 1)
    CatalogoEventos.agregarEvento("Seminario Cloud",     29.99,  0, 1)
    CatalogoEventos.agregarEvento("Foro de Negocios",   349.99,  5, 2)
    CatalogoEventos.agregarEvento("Taller Kotlin",      149.99,  8, 3)

    println("=== Todos los eventos ===")
    CatalogoEventos.listar().forEach { e ->
        val estado = if (e.disponible) "✅" else "❌"
        println("$estado ${e.nombre} — ${"%.2f".format(e.costoConIva)} (con IVA)")
    }

    println("\n=== Disponibles con 10% descuento ===")
    CatalogoEventos.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("  ${it.nombre}: ${"%.2f".format(it.costo)}") }
}