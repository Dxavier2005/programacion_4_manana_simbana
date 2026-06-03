void main() {
  // while — verificación de cupos antes de registrar asistentes
  int asistentes = 0;
  int cuposDisponibles = 10;

  while (cuposDisponibles > 0) {
    final ingreso = cuposDisponibles > 2 ? 2 : cuposDisponibles;
    asistentes++;
    cuposDisponibles -= ingreso;
    print('Asistente $asistentes registrado (cupos restantes: $cuposDisponibles)');
  }

  // do-while — registro de intento de acceso al evento
  int intentos = 0;
  bool accesoPermitido = false;

  do {
    intentos++;
    print('Intento de acceso #$intentos...');

    if (intentos == 3) accesoPermitido = true;
  } while (!accesoPermitido && intentos < 5);

  print(accesoPermitido
      ? 'Acceso concedido tras $intentos intentos'
      : 'Acceso denegado al evento');
}