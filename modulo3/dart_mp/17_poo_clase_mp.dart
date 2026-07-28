class Evento {
  final String id;
  final String nombre;
  String ubicacion;
  bool _activo = false;

  Evento({
    required this.id,
    required this.nombre,
    required this.ubicacion,
  });

  bool get activo => _activo;
  String get estado => _activo ? 'activo' : 'inactivo';

  set estadoActivo(bool valor) {
    _activo = valor;
    print('$nombre: ${valor ? "iniciado" : "finalizado"}');
  }

  void iniciar() {
    _activo = true;
    print('$nombre iniciado en $ubicacion');
  }

  void finalizar() {
    _activo = false;
    print('$nombre finalizado');
  }

  String resumen() => 'ID: $id | Evento: $nombre | Ubicación: $ubicacion | Estado: $estado';

  @override
  String toString() => 'Evento($nombre, $ubicacion, $estado)';
}

void main() {
  final conferencia = Evento(
    id: 'EVT-001',
    nombre: 'Conferencia Flutter',
    ubicacion: 'Auditorio Central',
  );

  conferencia.iniciar();
  print(conferencia.estado);
  print(conferencia.resumen());
  print(conferencia);

  conferencia.estadoActivo = false;
  print(conferencia.activo);
}