import 'dart:io';

void main() {
  print('Ingrese su nombre del asistente:');
  String? nombre = stdin.readLineSync();
  print('Bienvenido al evento $nombre');

  print('Ingrese su edad:');
  int edad = int.parse(stdin.readLineSync()!);
  print('Edad registrada: $edad');

  print('Ingrese el precio de la entrada:');
  double precio = double.parse(stdin.readLineSync()!);
  print('Precio de entrada: $precio');

  print('Ingrese cupos reservados:');
  int a = int.parse(stdin.readLineSync()!);

  print('Ingrese cupos disponibles:');
  int b = int.parse(stdin.readLineSync()!);

  int totalCupos = a + b;

  print('Total de cupos gestionados: $totalCupos');
}