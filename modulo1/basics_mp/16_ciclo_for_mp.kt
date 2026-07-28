fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo For")

    print("For con rango")
    for (i in 1..10) {
        println(" Sala 5 - Conferencia $i")
    }

    println("For con until")
    for (i in 1 until 5) {
        println(i)
    }

    println("For con pasos")
    for (i in 1..10 step 3) {
        println(i)
    }

    println("For descendente")
    for (i in 10 downTo 1) {
        println(i)
    }

    println("For con listas")
    val eventos = listOf("Conferencia IA", "Seminario Cloud", "Taller Kotlin")
    for (evento in eventos) {
        println(evento)
    }

    println("For con listas index valor")
    for ((index, valor) in eventos.withIndex()) {
        println("$index -> $valor")
    }

    println("For con break")
    for (i in 1..10) {
        if (i == 5) {
            break
        }
    }

    println("For con continue")
    for (i in 1..10) {
        if (i == 3) {
            continue
        }
        println("item: $i")
    }

    println("For con continue")
    for (i in 1..10) {
        if (i == 3) continue
        if (i == 7) break
        println("item $i")
    }

    val asistentes = listOf(
        Triple("Garcia, M", 2, true),
        Triple("Zambrano, L", 5, false),
        Triple("Torres, R", 7, true),
    )

    for ((posicion, asistente) in asistentes.withIndex()) {
        val (nombre, eventosInscritos, acreditado) = asistente

        val estadoInscripcion =
            if (eventosInscritos >= 5) "Alta Participación" else "Participación Normal"

        val estadoAcreditacion =
            if (acreditado) "Acreditado" else "Pendiente"

        println(
            "Asistente $posicion - $nombre - Eventos Inscritos: $eventosInscritos " +
            "$estadoInscripcion - Estado: $estadoAcreditacion"
        )
    }
}