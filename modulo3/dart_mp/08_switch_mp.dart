void main() {
  String codigoEvento = '404';

  switch (codigoEvento) {
    case '200':
      print('Registro exitoso');
    case '201':
      print('Inscripción creada');
    case '400':
      print('Solicitud inválida');
    case '401':
      print('Acceso no autorizado');
    case '404':
      print('Evento no encontrado');
    case '500':
      print('Error del sistema de eventos');
    default:
      print('Código desconocido');
  }
}

void main2() {
  String codigoEvento = '404';

  switch (codigoEvento) {
    case '200':
      print('Registro exitoso');
    case '201':
      print('Inscripción creada');
    case '400':
      print('Solicitud inválida');
    case '401':
      print('Acceso no autorizado');
    case '404':
      print('Evento no encontrado');
    case '500':
      print('Error del sistema de eventos');
    default:
      print('Código desconocido');
  }
}

int codigoNumerico = 404;

// Clasificación de respuestas del sistema de eventos
String categoria = switch (codigoNumerico) {
  200 || 201 || 204 => 'Éxito en gestión de eventos (2xx)',
  301 || 302 || 307 => 'Redirección del sistema (3xx)',
  400 || 401 || 403 || 404 => 'Error en solicitud de evento (4xx)',
  500 || 502 || 503 => 'Error del servidor de eventos (5xx)',
  _ => 'Estado desconocido',
};

void main3() {
  print(categoria);

  double temperatura = 39.2;

  String alerta = switch (temperatura) {
    double t when t >= 40.0 => '🚨 Evento suspendido por emergencia médica',
    double t when t >= 38.5 => '🔴 Asistente con fiebre alta',
    double t when t >= 37.5 => '🟡 Revisión en ingreso al evento',
    double t when t >= 36.0 => '🟢 Apto para ingreso',
    _ => '🔵 Fuera de rango normal',
  };

  print(alerta);
}