// La interfaz define el contrato — QUÉ puede hacer
// Las implementaciones definen el CÓMO
interface Inscribible {
    fun procesar(monto: Double): Boolean
    val nombre: String
}

class TarjetaCredito(val numero: String) : Inscribible {
    override val nombre = "Pago con tarjeta de crédito"
    override fun procesar(monto: Double): Boolean {
        println("💳 Procesando inscripción de $${"%.2f".format(monto)} con tarjeta $numero")
        return true
    }
}

class PayPal(val email: String) : Inscribible {
    override val nombre = "Pago con PayPal"
    override fun procesar(monto: Double): Boolean {
        println("🅿️ Procesando inscripción de $${"%.2f".format(monto)} a $email")
        return true
    }
}

class Efectivo : Inscribible {
    override val nombre = "Pago en efectivo"
    override fun procesar(monto: Double): Boolean {
        println("💵 Recibiendo inscripción de $${"%.2f".format(monto)} en efectivo")
        return true
    }
}

class Cheque : Inscribible {
    override val nombre = "Pago con cheque"
    override fun procesar(monto: Double): Boolean {
        println("💵 Registrando inscripción de $${"%.2f".format(monto)} con cheque")
        return true
    }
}

// Esta función no sabe ni le importa qué tipo de pago es
// Solo sabe que recibe algo que implementa Inscribible — POLIMORFISMO
fun cobrar(monto: Double, metodoPago: Inscribible) {
    println("Procesando inscripción con ${metodoPago.nombre}...")
    val exito = metodoPago.procesar(monto)
    println(if (exito) "✅ Inscripción exitosa" else "❌ Inscripción fallida")
}

fun main() {
    val metodos: List<Inscribible> = listOf(
        TarjetaCredito("**** **** **** 1234"),
        PayPal("ana@evento.com"),
        Efectivo()
    )

    // Misma función — comportamiento distinto según el tipo
    metodos.forEach { cobrar(99.99, it) }
}