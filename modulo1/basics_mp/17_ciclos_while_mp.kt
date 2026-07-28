fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo While")

    println("While Basico")
    var contador = 1

    while (contador <= 5) {
        println("Evento $contador")
        contador++
    }

    println("Do While")
    contador = 1

    do {
        println("Sala $contador")
        contador++
    } while (contador <= 5)

    println("break continue")
    contador = 1

    while (contador <= 10) {
        contador++

        if (contador == 3) continue
        if (contador == 7) break

        println("Asistente $contador")
    }

    var input: String

    while (true) {
        println("Escriba 'salir' para finalizar el registro de eventos")
        input = readLine() ?: ""

        if (input == "salir") break

        println("Evento ingresado: $input")
    }
}