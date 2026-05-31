class Libro(
    val titulo: String,
    val autor: String,
    val anioPublicacion: Int,
    val paginas: Int
) {
    fun mostrarInformacion() {
        println("Título: $titulo")
        println("Autor: $autor")
        println("Año: $anioPublicacion")
        println("Páginas: $paginas")
    }

    fun esAntiguo() {
        if (anioPublicacion < 2000) {
            println("El libro es antiguo")
        } else {
            println("El libro es reciente")
        }
    }
}

fun main() {
    val libro1 = Libro(
        "Clean Code",
        "Robert Martin",
        2008,
        464
    )

    libro1.mostrarInformacion()
    libro1.esAntiguo()
}