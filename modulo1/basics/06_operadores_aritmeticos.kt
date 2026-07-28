fun main() {
    println("Operadores Aritméticos")
    val numero1 = 10
    val numero2 = 2
    println("Suma")
    println("$numero1 + $numero2 : ${numero1+numero2}")
    println("Resta")
    println("$numero1 - $numero2 : ${numero1-numero2}")
    println("Multiplicacion")
    println("$numero1 * $numero2 : ${numero1*numero2}")
    println("Division")
    println("$numero1 / $numero2 : ${numero1/numero2}")
    println("Módulo")
    println("$numero1 % $numero2 : ${numero1%numero2}")
    
    println("Ingrese el primer numero")
    val numero1 = readLine()!!.toInt()
    println("Ingrese el segundo numero")
    val numero2 = readLine()!!.toInt()
    println("Suma")
    println("$numero1 + $numero2 : ${numero1+numero2}")
    println("Resta")
    println("$numero1 - $numero2 : ${numero1-numero2}")
    println("Multiplicacion")
    println("$numero1 * $numero2 : ${numero1*numero2}")
    println("Division")
    println("$numero1 / $numero2 : ${numero1/numero2}")
    println("Módulo")
    println("$numero1 % $numero2 : ${numero1%numero2}")
    
    
    println("Operadores de asingacion compuesta")
    var x = 10
    x+=5
    println("x +=5 $x")
    x-=3
    println("x -=3 $x")
    
    x*=6
    println("x *=3 $x")
    
    x/=2
    println("x /=2 $x")
    
    x%=3
    println("x %=2 $x")
    
    
    //Incremento o Decremento
    x++
    println("x++ $x")
    x--
    println("x-- $x")
} 