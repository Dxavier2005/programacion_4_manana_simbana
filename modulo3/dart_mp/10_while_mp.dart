void main() {
  final eventos = ['Conferencia Flutter', 'Workshop UI', 'Seminario Dart', 'Meetup Mobile'];

  // for-in — recorrido de eventos
  for (final evento in eventos) {
    print(evento);
  }

  // forEach con lambda — formato funcional
  eventos.forEach((e) => print(e.toLowerCase()));

  // for-in sobre Map — eventos con cupos
  final cupos = {
    'Conferencia Flutter': 120,
    'Workshop UI': 45,
    'Seminario Dart': 80,
  };

  for (final entrada in cupos.entries) {
    print('${entrada.key} → cupos ${entrada.value}');
  }

  // for-in sobre caracteres de un String
  /*
  for (final caracter in 'Evento') {
    print(caracter);
  }
  */
}