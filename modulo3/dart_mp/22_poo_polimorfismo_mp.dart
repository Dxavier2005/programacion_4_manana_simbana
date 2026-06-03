// Reusamos la jerarquía de eventos del sistema
abstract class Evento {
  String get nombre;
  double calcularCosto();
}

class ConferenciaPoli extends Evento {
  final double costoBase;
  ConferenciaPoli(this.costoBase);

  @override
  String get nombre => 'Conferencia';

  @override
  double calcularCosto() => costoBase * 1.2;
}

class TallerPoli extends Evento {
  final double costoBase;
  final int horas;

  TallerPoli(this.costoBase, this.horas);

  @override
  String get nombre => 'Taller';

  @override
  double calcularCosto() => costoBase * horas;
}

class MeetupPoli extends Evento {
  final double costoBase;

  MeetupPoli(this.costoBase);

  @override
  String get nombre => 'Meetup';

  @override
  double calcularCosto() => costoBase;
}

// POLIMORFISMO: una sola función trabaja con cualquier Evento
void imprimirCosto(Evento evento) {
  print('${evento.nombre}: ${evento.calcularCosto().toStringAsFixed(2)} USD');
}

void main() {
  final eventos = <Evento>[
    ConferenciaPoli(100),
    TallerPoli(50, 4),
    MeetupPoli(20),
  ];

  for (final e in eventos) {
    imprimirCosto(e);
  }

  final mayor = eventos.reduce(
    (a, b) => a.calcularCosto() > b.calcularCosto() ? a : b,
  );

  print('\nEvento más costoso: ${mayor.nombre}');
}