void main() {
  String codigoHttp = '404';

  switch (codigoHttp) {
    case '200':
      print('OK');
    case '201':
      print('Creado');
    case '400':
      print('Petición incorrecta');
    case '401':
      print('No autorizado');
    case '404':
      print('No encontrado');
    case '500':
      print('Error del servidor');
    default:
      print('Código desconocido');
  }
}

void main() {
  String codigoHttp = '404';

  switch (codigoHttp) {
    case '200':
      print('OK');
    case '201':
      print('Creado');
    case '400':
      print('Petición incorrecta');
    case '401':
      print('No autorizado');
    case '404':
      print('No encontrado');
    case '500':
      print('Error del servidor');
    default:
      print('Código desconocido');
  }
}
int codigoNumerico = 404;

  // Múltiples valores en una rama con ||
  String categoria = switch (codigoNumerico) {
    200 || 201 || 204       => 'Éxito (2xx)',
    301 || 302 || 307       => 'Redirección (3xx)',
    400 || 401 || 403 || 404 => 'Error del cliente (4xx)',
    500 || 502 || 503       => 'Error del servidor (5xx)',
    _                       => 'Desconocido',
  };

  print(categoria);  // Error del cliente (4xx)

  // Guards — condición adicional con 'when'
  double temperatura = 39.2;

  String alerta = switch (temperatura) {
    double t when t >= 40.0 => '🚨 CRÍTICO — llame a emergencias',
    double t when t >= 38.5 => '🔴 FIEBRE ALTA — consulte médico',
    double t when t >= 37.5 => '🟡 FIEBRE LEVE — descanse',
    double t when t >= 36.0 => '🟢 NORMAL',
    _                       => '🔵 HIPOTERMIA — abrígese',
  };

  print(alerta);  // 🔴 FIEBRE ALTA — consulte médico
}