void main() {
  // --- Tus variables originales ---
  var nombre = 'Ana';
  var edad = 28;
  var precioEntrada = 89.99;
  var inscrito = true;

  String apellido = 'García';
  int cupos = 100;
  double pi = 3.14159;
  bool visible = false;

  final evento = 'Conferencia Flutter 2026';
  const capacidadMaxima = 200;
  const tarifaBase = 50.0;

  final ahora = DateTime.now();

  print('$nombre $apellido inscrito en $evento');

  // --- El bloque que daba error (Movido aquí adentro) ---
  var contadorInscritos = 0;
  contadorInscritos = 1;

  final listaAsistentes = ['Ana', 'Luis', 'Carlos'];
  listaAsistentes.add('María');

  const tiposEventos = ['Conferencia', 'Workshop', 'Seminario'];

  // Agregamos unos prints para que puedas ver que todo funciona
  print('Contador: $contadorInscritos');
  print('Asistentes actuales: $listaAsistentes');
  print('Tipos de eventos: $tiposEventos');
  print('Hora de ejecución: $ahora');
}