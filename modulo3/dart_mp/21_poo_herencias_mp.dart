// Clase base — comportamiento común de todos los elementos del sistema de eventos
class NodoEvento {
  final String id;
  final String nombre;
  bool _activo = false;

  NodoEvento({required this.id, required this.nombre});

  bool get activo => _activo;
  String get estado => _activo ? 'activo' : 'inactivo';

  void encender() {
    _activo = true;
    print('$nombre [$id]: activado');
  }

  void apagar() {
    _activo = false;
    print('$nombre [$id]: desactivado');
  }

  @override
  String toString() => '$nombre — $estado';
}

// HERENCIA: servidor de eventos
class ServidorEventos extends NodoEvento {
  final String sistema;
  final int cpuCores;
  final double ramGb;
  final _servicios = <String>[];

  ServidorEventos({
    required super.id,
    required super.nombre,
    required this.sistema,
    required this.cpuCores,
    required this.ramGb,
  });

  @override
  void encender() {
    super.encender();
    print('  → Sistema $sistema iniciando servicios...');
    print('  → $cpuCores cores / ${ramGb}GB RAM asignados');
  }

  void instalarServicio(String nombre) {
    _servicios.add(nombre);
    print('Servicio $nombre instalado en ${this.nombre}');
  }

  List<String> get servicios => List.unmodifiable(_servicios);

  @override
  String toString() =>
      'ServidorEventos(${super.toString()}, SO: $sistema, Servicios: ${_servicios.length})';
}

// HERENCIA: router de red del sistema de eventos
class RouterEventos extends NodoEvento {
  final List<String> interfaces;
  int traficoPps = 0;

  RouterEventos({
    required super.id,
    required super.nombre,
    required this.interfaces,
  });

  void registrarTrafico(int pps) {
    traficoPps = pps;
    if (pps > 100000) {
      print('⚠️ ${nombre}: tráfico alto ($pps pps)');
    }
  }

  @override
  String toString() =>
      'RouterEventos(${super.toString()}, interfaces: ${interfaces.length}, $traficoPps pps)';
}

void main() {
  final servidor = ServidorEventos(
    id: 'EVT-SRV-01',
    nombre: 'plataforma-eventos',
    sistema: 'Ubuntu 24.04',
    cpuCores: 16,
    ramGb: 64,
  );

  final router = RouterEventos(
    id: 'EVT-RTR-01',
    nombre: 'red-eventos',
    interfaces: ['eth0', 'eth1', 'eth2', 'eth3'],
  );

  servidor.encender();
  servidor.instalarServicio('inscripciones-api');
  servidor.instalarServicio('notificaciones');

  router.encender();
  router.registrarTrafico(125000);

  print('\n$servidor');
  print(router);
}