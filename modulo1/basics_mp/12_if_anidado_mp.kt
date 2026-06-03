fun main() {
    println("Controles de Flujo")
    println("Condicional If - Anidado")

    println("¿El asistente tiene acreditación VIP? (s/n): ")
    val tieneAcreditacionVIP = readLine()?.trim()?.lowercase() == "s"

    println("Cantidad de eventos inscritos:")
    val eventosInscritos = readLine()?.toIntOrNull() ?: 0

    if (tieneAcreditacionVIP) {
        println("Asistente con acreditación VIP")

        if (eventosInscritos < 2) {
            println("Participación baja")
        } else if (eventosInscritos > 5) {
            println("Participación destacada")
        } else {
            println("Participación normal")
        }

    } else {
        println("Asistente sin acreditación VIP")

        if (eventosInscritos < 2 || eventosInscritos > 5) {
            println("Cantidad de inscripciones fuera del rango habitual")
        } else {
            println("Cantidad de inscripciones normal")
        }
    }
}