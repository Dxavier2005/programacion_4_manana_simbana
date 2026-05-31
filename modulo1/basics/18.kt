fun main() {
    println("Controles de flujo Iteraciones. Ciclo repetitivo - While")
    println("While básico")

    var contador = 1

    while (contador <= 5) {
        println(contador)
        contador++
    } 

    
    println("Do While")
    contador = 1
    do {
        println(contador)
        contador++
    } while (contador <= 5)

    
    println("break continue")
    contador = 0 
    while (contador < 10) {
        contador++
        
        
        if (contador == 3) continue
        if (contador == 7) break
        
        println(contador)
    }
    
 
   var input: String
   while(true){
      println("Escribe 'salir' para terminar:")
      input=readLine()?:" "
      if (input=="salir") break
      println("usted ingreso: $input")
   }
}