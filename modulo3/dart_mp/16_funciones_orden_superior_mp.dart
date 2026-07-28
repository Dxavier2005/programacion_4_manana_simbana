void main() {
  final preciosEntradas = [29.99, 49.50, 15.00, 99.99];

  // map devuelve un Iterable con cada elemento transformado
  final preciosConIva = preciosEntradas.map((p) => p * 1.15);
  print(preciosConIva.toList());

  // map sobre Strings — generación de enlaces del sistema de eventos
  final endpoints = ['/usuarios', '/conferencias', '/inscripciones'];
  final urls = endpoints.map((e) => 'https://api.eventos.com$e');
  print(urls.toList());

  final temperaturas = [36.1, 37.8, 39.2, 36.5, 38.7, 35.9];

  final conFiebre = temperaturas.where((t) => t > 37.5);
  print(conFiebre.toList());

  final normales = temperaturas.where((t) => t >= 36.0 && t <= 37.5);
  print(normales.toList());
}