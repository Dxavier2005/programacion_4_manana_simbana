class Evento {
  final String id;
  final String nombre;
  final String ubicacion;
  final String categoria;
  final bool esGratis;

  // Constructor principal
  Evento({
    required this.id,
    required this.nombre,
    required this.ubicacion,
    required this.categoria,
    this.esGratis = true,
  });

  // Constructor nombrado — evento local
  Evento.local()
      : id = 'EVT-LOCAL',
        nombre = 'Evento Local',
        ubicacion = 'Sala Comunitaria',
        categoria = 'Comunidad',
        esGratis = true;

  // Constructor nombrado — evento premium
  Evento.premium({required this.id, required this.nombre})
      : ubicacion = 'Auditorio Principal',
        categoria = 'Conferencia',
        esGratis = false;

  // Factory — creación desde texto tipo URL o código
  factory Evento.desdeCodigo(String codigo) {
    final partes = codigo.split('-');

    return Evento(
      id: codigo,
      nombre: partes.isNotEmpty ? partes[0] : 'Evento',
      ubicacion: 'Por definir',
      categoria: 'General',
      esGratis: true,
    );
  }

  @override
  String toString() =>
      '$nombre | $ubicacion | ${esGratis ? "Gratis" : "Pagado"}';
}

void main() {
  final e1 = Evento(
    id: 'EVT-001',
    nombre: 'Conferencia Flutter',
    ubicacion: 'Auditorio Central',
    categoria: 'Tecnología',
  );

  final e2 = Evento.local();
  final e3 = Evento.premium(id: 'EVT-002', nombre: 'Workshop Avanzado');
  final e4 = Evento.desdeCodigo('FLUTTER-2026');

  print(e1);
  print(e2);
  print(e3);
  print(e4);
}