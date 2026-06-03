void main() {
  List<String> eventos = ['Conferencia Flutter', 'Workshop UI', 'Seminario Dart'];
  var inscritos = [10, 25, 40];

  print(eventos[0]);
  print(eventos.length);

  eventos.add('Meetup Mobile');
  eventos.remove('Workshop UI');

  Map<String, int> asistentes = {
    'Flutter Conf': 120,
    'Dart Day': 80,
    'UI Workshop': 45,
  };

  print(asistentes['Flutter Conf']);
  print(asistentes['Dev Summit']);
  asistentes['Meetup Mobile'] = 60;

  Set<String> categorias = {'conferencia', 'workshop', 'seminario'};
  categorias.add('conferencia');

  var lista1 = ['Flutter Conf', 'Dart Day'];
  var lista2 = ['UI Workshop', 'Meetup Mobile'];
  var combinada = [...lista1, ...lista2];
  print(combinada);

  bool mostrarExtra = true;

  var agenda = [
    'registro',
    'inauguracion',
    if (mostrarExtra) 'networking',
  ];

  var duraciones = [for (var i = 1; i <= 5; i++) i * 30];
  print(duraciones);
}