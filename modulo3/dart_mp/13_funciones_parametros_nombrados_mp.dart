void configurarServidor({
  required String host,
  required int puerto,
  bool ssl = true,
  int timeoutSeg = 30,
}) {
  final protocolo = ssl ? 'https' : 'http';
  print('Conectando al sistema de eventos $protocolo://$host:$puerto (timeout: ${timeoutSeg}s)');
}

void main() {
  configurarServidor(
    host: 'eventos.empresa.com',
    puerto: 5432,
    ssl: false,
    timeoutSeg: 60,
  );

  configurarServidor(
    host: 'api.eventos.com',
    puerto: 443,
  );
}