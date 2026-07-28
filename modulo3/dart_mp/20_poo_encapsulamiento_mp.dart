class EventoInscripcion {
  final String participante;
  double _pagado;

  EventoInscripcion(this.participante, double pagoInicial)
      : _pagado = pagoInicial;

  double get totalPagado => _pagado;

  void pagar(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    _pagado += monto;
    print('Pago de \$$monto registrado. Total pagado: \$$_pagado');
  }

  void reembolsar(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    if (monto > _pagado) throw StateError('No hay saldo suficiente en la inscripción');
    _pagado -= monto;
    print('Reembolso de \$$monto realizado. Total pagado: \$$_pagado');
  }
}

void main() {
  final inscripcion = EventoInscripcion('Ana López', 100.0);

  inscripcion.pagar(50.0);
  inscripcion.reembolsar(20.0);
  print(inscripcion.totalPagado);

  // inscripcion._pagado = 999; // ERROR — acceso privado
}