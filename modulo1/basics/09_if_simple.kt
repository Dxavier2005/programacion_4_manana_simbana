fun main() {
    println("Controles de Flujo")
    println("Condicional If")
    println("Temperastura en grados C")

    val temperatura = readLine()?.toDoubleOrNull() ?: 36.5

    if (temperatura >= 40.0) {
        println("Fiebre alta: atención de emergencia inmediata")
    } else if (temperatura >= 38.0) {
        println("Fiebre detectada: derivar consulta prioritaria")
    }

    println("Temperatura registrada: $temperatura grados centígrados")
}
