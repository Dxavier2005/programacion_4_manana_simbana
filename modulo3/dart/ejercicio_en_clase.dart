import 'dart:io';

void main() {
  print('Usuario Ingresa un año por consola');
  
  double año = double.parse(stdin.readLineSync()!);

  if (año % 4 == 0 && (año % 100 != 0 || año % 400 == 0)) { 
    print('El año $año es bisiesto');
  } else {
    print('El año $año no es bisiesto');
  }


 