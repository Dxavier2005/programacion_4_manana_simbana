object ConfiguracionEvento {
    val host: String = "eventos.conferencias.com"
    val puerto: Int = 443
    private val apiKey: String = "ev-secreto-123"   // privado — nunca expuesto

    fun baseUrl() = "https://$host:$puerto"
    fun headers() = mapOf("Authorization" to "Bearer $apiKey")
}

class Asistente private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        // Factory function — encapsulamiento del constructor
        fun crear(nombre: String, email: String): Asistente? {
            if (nombre.isBlank() || !email.contains("@")) return null
            return Asistente(++contadorId, nombre.trim())
        }

        const val ROL_DEFECTO = "asistente"
    }
}

fun main() {
    println(ConfiguracionEvento.baseUrl())  // https://eventos.conferencias.com:443
    // ConfiguracionEvento.apiKey            // ERROR — privado

    val a = Asistente.crear("Ana García", "ana@evento.com")
    println(a)  // Asistente(id=1, nombre=Ana García)
}