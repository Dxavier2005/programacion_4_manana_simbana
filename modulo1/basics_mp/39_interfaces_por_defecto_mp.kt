interface Serializable {
    val id: String                    // abstracta — debe implementarse
    fun serializar(): String          // abstracta — debe implementarse
    val version: Int get() = 1        // con default — puede sobreescribirse
}

interface Validable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun validar(): Boolean
    fun imprimirErrores() {                // implementación por defecto
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  ❌ $it") }
    }
}

// POLIMORFISMO: Evento puede usarse donde se espere Serializable O Validable
data class Evento(
    override val id: String,
    val nombre: String,
    val asistentes: List<String>,
    val costo: Double
) : Serializable, Validable {

    override fun serializar() =
        "$id|$nombre|${asistentes.joinToString(",")}|$costo"

    override val errores: List<String> get() = buildList {
        if (nombre.isBlank()) add("El nombre del evento no puede estar vacío")
        if (asistentes.isEmpty()) add("El evento debe tener al menos un asistente")
        if (costo <= 0) add("El costo debe ser mayor que cero")
    }

    override fun validar() = esValido
}

fun main() {
    val evento1 = Evento("E001", "Conferencia IA", listOf("Ana", "Luis"), 119.98)
    val evento2 = Evento("E002", "", emptyList(), -5.0)

    // Polimorfismo por interfaz
    fun procesarSerializable(s: Serializable) =
        println("→ ${s.serializar()}")

    fun procesarValidable(v: Validable) {
        println("Válido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarSerializable(evento1)
    procesarValidable(evento1)

    procesarValidable(evento2)
}