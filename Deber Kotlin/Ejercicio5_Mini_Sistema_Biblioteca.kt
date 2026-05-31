class Libro(
    val id: Int,
    val titulo: String,
    val autor: String
) {
    private var disponible = true

    fun estaDisponible(): Boolean {
        return disponible
    }

    fun prestar() {
        if (disponible) {
            disponible = false
            println("Libro prestado")
        } else {
            println("El libro ya está prestado")
        }
    }

    fun devolver() {
        if (!disponible) {
            disponible = true
            println("Libro devuelto")
        } else {
            println("El libro ya estaba disponible")
        }
    }

    fun mostrar() {
        println("$id - $titulo - $autor - Disponible: $disponible")
    }
}

class Biblioteca {
    private val libros = mutableListOf<Libro>()

    fun registrarLibro(libro: Libro) {
        libros.add(libro)
    }

    fun listarLibros() {
        libros.forEach { it.mostrar() }
    }

    fun buscarLibro(titulo: String) {
        libros.filter {
            it.titulo.contains(titulo, true)
        }.forEach {
            it.mostrar()
        }
    }
}

fun main() {

    val biblioteca = Biblioteca()

    val libro1 = Libro(
        1,
        "Clean Code",
        "Robert Martin"
    )

    val libro2 = Libro(
        2,
        "Kotlin Básico",
        "JetBrains"
    )

    biblioteca.registrarLibro(libro1)
    biblioteca.registrarLibro(libro2)

    biblioteca.listarLibros()

    libro1.prestar()
    libro1.prestar()

    libro1.devolver()

    biblioteca.buscarLibro("Clean")
}