void main() {
  final nombre = 'Ana';
  final edad   = 28;

  // Interpolación con $ (igual que en Kotlin)
  print('Hola, $nombre');                    // Hola, Ana

  // Expresión con ${ }
  print('${nombre.toUpperCase()} asistirá a la conferencia el próximo año');

  // String multilinea con triple comillas
  final tarjeta = '''
Nombre: $nombre
Edad:   $edad
Estado: ${edad >= 18 ? 'Registrado en el evento' : 'No registrado'}
  ''';
  print(tarjeta);

  // Raw string — rutas del sistema de eventos
  final ruta = r'C:\Eventos\Conferencias\2026';
  print(ruta);

  // Concatenación (menos recomendado — mejor interpolación)
  final saludo = 'Hola, ' + nombre + '!';

  // Métodos útiles de String en gestión de eventos
  print('flutter conf'.toUpperCase());           // FLUTTER CONF
  print('  Flutter Event  '.trim());             // Flutter Event
  print('Flutter'.contains('lut'));              // true
  print('Evento Flutter'.replaceAll('Flutter', 'Dart'));
  print('a,b,c'.split(','));                     // [a, b, c]
  print('Conferencia'.substring(0, 4));          // Conf
  print('Evento'.startsWith('Eve'));             // true
  print('abc'.padLeft(5, '0'));                  // 00abc
  print('abc'.padRight(7, '0'));                 // abc0000
}