class EventoConferencia(titular: String, cuposIniciales: Double) {

    val organizador: String = titular       // público — cualquiera puede leer

    private var cupos: Double = cuposIniciales  // privado — solo esta clase lo modifica

    internal val codigoEvento: String =        // internal — visible en el mismo módulo
        "EV${(100000..999999).random()}"

    protected open fun calcularDisponibilidad(): Double = cupos * 0.02  // protected — visible en subclases

    // Los cupos solo cambian a través de estos métodos — NUNCA directamente
    fun registrarAsistentes(monto: Double) {
        require(monto > 0) { "La cantidad debe ser positiva" }
        cupos += monto
        println("Registrados: $${"%.2f".format(monto)} | Cupos actualizados: ${consultarCupos()}")
    }

    fun cancelarRegistro(monto: Double): Boolean {
        require(monto > 0) { "La cantidad debe ser positiva" }
        if (monto > cupos) {
            println("No hay suficientes cupos disponibles")
            return false
        }
        cupos -= monto
        println("Cancelados: $${"%.2f".format(monto)} | Cupos actualizados: ${consultarCupos()}")
        return true
    }

    fun consultarCupos(): String = "$${"%.2f".format(cupos)}"
}

fun main() {
    val evento = EventoConferencia("Ana García", 1000.0)

    evento.registrarAsistentes(500.0)    // Registrados: $500.00 | Cupos actualizados: $1500.00
    evento.cancelarRegistro(200.0)       // Cancelados: $200.00 | Cupos actualizados: $1300.00
    evento.cancelarRegistro(2000.0)      // No hay suficientes cupos disponibles

    println(evento.organizador)         // Ana García — acceso público permitido
    println(evento.consultarCupos())     // $1300.00
    // evento.cupos = 999999.0           // ERROR — cupos es privado
}