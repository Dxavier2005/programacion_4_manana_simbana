fun main() {
    println("Operadores Aritméticos")

    val asistentesDia1 = 10
    val asistentesDia2 = 2

    println("Suma")
    println("$asistentesDia1 + $asistentesDia2 : ${asistentesDia1 + asistentesDia2}")

    println("Resta")
    println("$asistentesDia1 - $asistentesDia2 : ${asistentesDia1 - asistentesDia2}")

    println("Multiplicacion")
    println("$asistentesDia1 * $asistentesDia2 : ${asistentesDia1 * asistentesDia2}")

    println("Division")
    println("$asistentesDia1 / $asistentesDia2 : ${asistentesDia1 / asistentesDia2}")

    println("Módulo")
    println("$asistentesDia1 % $asistentesDia2 : ${asistentesDia1 % asistentesDia2}")

    println("Ingrese la cantidad de asistentes del primer evento")
    val numero1 = readLine()!!.toInt()

    println("Ingrese la cantidad de asistentes del segundo evento")
    val numero2 = readLine()!!.toInt()

    println("Suma")
    println("$numero1 + $numero2 : ${numero1 + numero2}")

    println("Resta")
    println("$numero1 - $numero2 : ${numero1 - numero2}")

    println("Multiplicacion")
    println("$numero1 * $numero2 : ${numero1 * numero2}")

    println("Division")
    println("$numero1 / $numero2 : ${numero1 / numero2}")

    println("Módulo")
    println("$numero1 % $numero2 : ${numero1 % numero2}")

    println("Operadores de asignación compuesta")

    var inscritos = 10

    inscritos += 5
    println("inscritos += 5 $inscritos")

    inscritos -= 3
    println("inscritos -= 3 $inscritos")

    inscritos *= 6
    println("inscritos *= 6 $inscritos")

    inscritos /= 2
    println("inscritos /= 2 $inscritos")

    inscritos %= 3
    println("inscritos %= 3 $inscritos")

    // Incremento o Decremento
    inscritos++
    println("inscritos++ $inscritos")

    inscritos--
    println("inscritos-- $inscritos")
}