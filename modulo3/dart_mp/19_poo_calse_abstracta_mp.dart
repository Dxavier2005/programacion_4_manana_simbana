// abstract class define el contrato — QUÉ puede hacer cualquier entidad de evento
abstract class EventoBase {
  String get nombre;
  double calcularCosto();     
  int calcularDuracion();

  // Método concreto construido sobre la abstracción
  void describir() {
    print('$nombre — costo: ${calcularCosto().toStringAsFixed(2)}, '
          'duración: ${calcularDuracion()} horas');
  }
}

// Implementaciones concretas — el CÓMO es específico de cada tipo de evento
class Conferencia extends EventoBase {
  final double costoBase;
  final int duracionHoras;

  Conferencia(this.costoBase, this.duracionHoras);

  @override String get nombre => 'Conferencia';
  @override double calcularCosto() => costoBase * 1.2;
  @override int calcularDuracion() => duracionHoras;
}

class Taller extends EventoBase {
  final double costoBase;
  final int duracionHoras;

  Taller(this.costoBase, this.duracionHoras);

  @override String get nombre => 'Taller';
  @override double calcularCosto() => costoBase * 1.5;
  @override int calcularDuracion() => duracionHoras;
}

void main() {
  final eventos = <EventoBase>[
    Conferencia(100, 3),
    Taller(80, 5),
  ];

  for (final e in eventos) {
    e.describir();
  }
}