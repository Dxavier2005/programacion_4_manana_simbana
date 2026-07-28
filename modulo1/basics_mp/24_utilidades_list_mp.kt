fun main() {
    println("Utilidades List")

    println("map")
    val asistentes = listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    println(asistentes)

    val asistenciaCuadrada = asistentes.map { it * it }
    println(asistenciaCuadrada)

    val asistentesTexto = asistentes.map { "Asistente$it" }
    println(asistentesTexto)

    println("filter")

    val pares = asistentes.filter { it % 2 == 0 }
    println(pares)

    val mayores5 = asistentes.filter { it > 5 }
    println(mayores5)

    val paresYMayores5 = asistentes.filter { it % 2 == 0 && it > 5 }
    println(paresYMayores5)

    val impares = asistentes.filterNot { it % 2 == 0 }
    println(impares)

    val mezcla = listOf(1, "Evento", 2, "Conferencia", true, 42)
    val soloStrings = mezcla.filterIsInstance<String>()
    println(soloStrings)

    println("reduce")

    val asistentesReduce = listOf(1, 2, 3, 4, 5)
    val suma = asistentesReduce.reduce { acc, n -> acc + n }
    println(suma)

    val producto = asistentesReduce.reduce { acc, n -> acc * n }
    println(producto)

    println("fold")

    val sumaFold = asistentesReduce.fold(100) { acc, n -> acc + n }
    println(sumaFold)

    val productoFold = asistentesReduce.fold(100) { acc, n -> acc * n }
    println(productoFold)

    println("Ordenacion")

    println("Ascendente : ${asistentes.sorted()}")
    println("Descendente : ${asistentes.sortedDescending()}")
    println("Sorter by : ${asistentes.sortedBy { -it }}")

    println("Agregacion")

    println("Sumar : ${asistentes.sum()}")
    println("Promedio : ${asistentes.average()}")
    println("Minimo : ${asistentes.min()}")
    println("Maximo : ${asistentes.max()}")
    println("Contar : ${asistentes.count { it > 4 }}")

    println("Busqueda")

    println("Buscar : ${asistentes.find { it > 4 }}")
    println("Buscar ultimo : ${asistentes.findLast { it > 4 }}")
    println("Buscar any : ${asistentes.any { it > 4 }}")
    println("Buscar all : ${asistentes.all { it > 0 }}")
    println("Buscar none : ${asistentes.none { it == 10 }}")
}