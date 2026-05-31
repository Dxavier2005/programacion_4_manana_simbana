interface MetodoPago {
    fun procesarPago(monto: Double)
}

class PagoEfectivo : MetodoPago {
    override fun procesarPago(monto: Double) {
        println("Pago en efectivo: $$monto")
    }
}

class PagoTarjeta : MetodoPago {
    override fun procesarPago(monto: Double) {
        println("Pago con tarjeta: $$monto")
    }
}

class PagoTransferencia : MetodoPago {
    override fun procesarPago(monto: Double) {
        println("Pago por transferencia: $$monto")
    }
}

fun main() {

    val pagos = listOf(
        PagoEfectivo(),
        PagoTarjeta(),
        PagoTransferencia()
    )

    for (pago in pagos) {
        pago.procesarPago(100.0)
    }
}