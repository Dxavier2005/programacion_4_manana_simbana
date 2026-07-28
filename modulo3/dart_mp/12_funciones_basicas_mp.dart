// Sintaxis completa — funciones para gestión de eventos
int sumar(int a, int b) {
  return a + b;
}

// Sintaxis de flecha — cálculos simples
int multiplicar(int a, int b) => a * b;

// void — acciones en el sistema de eventos
void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

void main() {
  print(sumar(5, 3));          // 8
  print(multiplicar(4, 6));    // 24
  imprimirSeparador('Evento Inicio');
}

// Funciones con formato de datos de eventos
String formatearPrecio(double precio) => '\$${precio.toStringAsFixed(2)}';

formatearPrecioSinTipo(double precio) => '\$${precio.toStringAsFixed(2)}';

// Parámetros opcionales — configuración de URL del sistema de eventos
String construirUrl(String host, String ruta, [int? puerto]) {
  if (puerto != null) {
    return 'https://$host:$puerto$ruta';
  }
  return 'https://$host$ruta';
}

// Funciones de apoyo para gestión de eventos
void saludar() {
  print('Bienvenido al sistema de eventos');
}

int sumarSinParametros() {
  return 42;
}

String construirUrlV2(String host, String ruta, [int? puerto]) {
  if (puerto != null) {
    return 'https://$host:$puerto$ruta';
  }
  return 'https://$host$ruta';
}

void main2() {
  saludar();
  print(sumarSinParametros());
  print(sumar(5, 3));
  print(multiplicar(4, 6));
  imprimirSeparador('Inicio');
  print(formatearPrecio(1299.9));
  print(formatearPrecioSinTipo(49.99));
  print(construirUrl('example.com', '/api'));
  print(construirUrl('example.com', '/api', 8080));
  print(construirUrlV2('example.com', '/api', null));
}