void main() {
  // Gestión de temperatura en control de ingreso a evento
  int temperatura = 38;

  if (temperatura > 37.5) {
    print('Acceso restringido');
  } else if (temperatura > 36) {
    print('Ingreso permitido');
  } else {
    print('Revisión adicional');
  }

  // Operador ternario — decisión rápida de acceso
  String estado = temperatura > 37.5 ? 'No apto para ingreso' : 'Apto para ingreso';
  print(estado);

  // null-aware con ternario
  String? ciudad;
  String display = ciudad != null ? ciudad.toUpperCase() : 'Sin sede asignada';

  // Forma más concisa con ??
  String display2 = ciudad?.toUpperCase() ?? 'Sin sede asignada';
  print(display2);
}

// Control de datos del asistente al evento
void main2() {
  String? nombre;

  if (nombre != null) {
    print(nombre.length);
  }

  print(nombre?.length);

  int longitud = nombre?.length ?? 0;
  print(longitud);
}