class Asistente(val nombre: String, val email: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        // Encapsulamiento en acción: validamos antes de construir
        require(nombre.isNotBlank()) { "El nombre no puede estar vacío" }
        require(email.contains("@")) { "Email inválido: $email" }

        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail = email.substringAfter("@")
    }
}

fun main() {
    val a = Asistente("  Ana García  ", "ana@conferencia.dev")
    println(a.nombreNormalizado)  // ana garcía
    println(a.dominioEmail)       // conferencia.dev

    // Asistente("", "invalido")   // IllegalArgumentException — require falla
}