// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {

var totalTemperatura = 0
var totalFiebre = 0
  repeat(6) { i ->
        println("Ingrese su temperatura")
        var temperatura = readLine()?.toIntOrNull() ?: 0
        totalTemperatura += temperatura
        
        if(temperatura >= 38.5){
            totalFiebre ++;
        }
    }
    
    var promedio = totalTemperatura/6
    println("Promedio: $promedio")
    println("Fiebre sostenida: $totalFiebre")
    
    if(totalFiebre > 2){
        println("Fiebre sostenida")
    }
    
    
}