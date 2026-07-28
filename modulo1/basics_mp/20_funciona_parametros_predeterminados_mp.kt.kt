fun main() {
    println("Funciones")

    val saludo = saludo()
    println("$saludo")

    val suma: Int = sumar(5, 4)
    println(suma)

    println(restarTipoExpresion(5, 3))
}

// Función de saludo
fun saludo(): String {
    return "Bienvenido al Sistema de Gestión de Eventos y Conferencias"
}

// Función de suma (por ejemplo: total de asistentes en dos eventos)
fun sumar(a: Int, b: Int): Int {
    return a + b
}

// Tipo de expresión
fun restarTipoExpresion(a: Int, b: Int): Int = a - b

// Inferido (no se usa en main pero se mantiene)
fun restarTipoInferido(a: Int, b: Int): Int = a - b

// Función adicional relacionada al contexto
fun saludar(nombre: String) {
    println("Bienvenido $nombre al sistema de eventos")
}