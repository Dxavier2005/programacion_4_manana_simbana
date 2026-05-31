class ProductoInventario(
    val codigo: String,
    val nombre: String,
    private var precio: Double,
    private var stock: Int
) {

    fun consultarPrecio() {
        println("Precio: $$precio")
    }

    fun consultarStock() {
        println("Stock: $stock")
    }

    fun aumentarStock(cantidad: Int) {
        stock += cantidad
    }

    fun disminuirStock(cantidad: Int) {
        if (stock - cantidad >= 0) {
            stock -= cantidad
        }
    }

    fun cambiarPrecio(nuevoPrecio: Double) {
        if (nuevoPrecio >= 0) {
            precio = nuevoPrecio
        }
    }
}

fun main() {
    val producto = ProductoInventario(
        "P001",
        "Laptop",
        800.0,
        10
    )

    producto.consultarPrecio()
    producto.consultarStock()

    producto.aumentarStock(5)
    producto.cambiarPrecio(850.0)

    producto.consultarPrecio()
    producto.consultarStock()
}