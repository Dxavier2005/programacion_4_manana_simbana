int doblar(int n) => n * 2;
int triplicar(int n) => n * 3;

void main() {
  // La variable 'operacion' representa una acción en el sistema de eventos
  int Function(int) operacion;

  operacion = doblar;
  print(operacion(5));     // 10

  operacion = triplicar;
  print(operacion(5));     // 15

  // Lista de funciones — transformaciones de datos de eventos
  final transformaciones = <int Function(int)>[doblar, triplicar];

  for (final fn in transformaciones) {
    print(fn(10));         // 20, luego 30
  }
}