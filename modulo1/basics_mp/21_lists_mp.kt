fun main() {
    val eventos = listOf("Conferencia IA", "Seminario Cloud", "Taller Kotlin", "Foro Tecnología")

    println("Verificar existencia de un elemento: ${"Seminario Cloud" in eventos}")

    println("sublista: ${eventos.subList(1, 3)}")
    println("tomar primeros 2 elementos: ${eventos.take(2)}")
    println("suprimir tres primeros elementos: ${eventos.drop(3)}")
    println("tomar los últimos dos elementos: ${eventos.takeLast(2)}")

    for (evento in eventos) {
        println(evento)
    }

    println("Listas Mutables")
    val salas = mutableListOf("Sala A", "Sala B", "Sala C", "Sala D")

    printEventos(salas)

    salas.add("Sala E")
    println(salas)

    salas.add(0, "Auditorio Principal")
    println(salas)

    salas.remove("Sala E")
    println(salas)

    salas[1] = "Sala VIP"
    println(salas)

    for (sala in salas) {
        println(sala)
    }

    println("Array deque")
    val deque = ArrayDeque<Int>()

    println(deque)
    deque.addFirst(1)
    println(deque)
    deque.addLast(2)
    println(deque)
    deque.addLast(0)
    println(deque)

    deque.removeFirst()
    println(deque)
    deque.removeLast()
    println(deque)
}

fun printEventos(salas: List<String>) {
    for (sala in salas) {
        println(sala)
    }
}