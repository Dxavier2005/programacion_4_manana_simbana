// Clase base — define el comportamiento común de todos los nodos
class Nodo {
  final String id;
  final String nombre;
  bool _activo = false;

  Nodo({required this.id, required this.nombre});

  bool   get activo => _activo;
  String get estado => _activo ? 'operativo' : 'fuera de servicio';

  void encender() {
    _activo = true;
    print('$nombre [$id]: encendido');
  }

  void apagar() {
    _activo = false;
    print('$nombre [$id]: apagado');
  }

  @override
  String toString() => '$nombre — $estado';
}

// HERENCIA: Servidor reutiliza todo de Nodo y lo especializa
class Servidor extends Nodo {
  final String sistemaOperativo;
  final int    cpuCores;
  final double ramGb;
  final _servicios = <String>[];

  Servidor({
    required super.id,
    required super.nombre,
    required this.sistemaOperativo,
    required this.cpuCores,
    required this.ramGb,
  });

  @override
  void encender() {
    super.encender();           // reutiliza el código del padre
    print('  → $sistemaOperativo arrancando...');
    print('  → $cpuCores cores / ${ramGb}GB RAM disponibles');
  }

  void instalarServicio(String nombre) {
    _servicios.add(nombre);
    print('$nombre instalado en ${this.nombre}');
  }

  List<String> get servicios => List.unmodifiable(_servicios);

  @override
  String toString() =>
      'Servidor(${super.toString()}, '
      'SO: $sistemaOperativo, '
      'Servicios: ${_servicios.length})';
}

// HERENCIA: Enrutador especializa Nodo de una forma diferente
class Enrutador extends Nodo {
  final List<String> interfaces;
  int paquetesPorSeg = 0;

  Enrutador({
    required super.id,
    required super.nombre,
    required this.interfaces,
  });

  void registrarTrafico(int pps) {
    paquetesPorSeg = pps;
    if (pps > 100000) {
      print('⚠️ ${nombre}: tráfico alto ($pps pps)');
    }
  }

  @override
  String toString() =>
      'Enrutador(${super.toString()}, '
      '${interfaces.length} interfaces, '
      '$paquetesPorSeg pps)';
}

void main() {
  final servidor = Servidor(
    id: 'SRV-01', nombre: 'prod-web',
    sistemaOperativo: 'Ubuntu 24.04',
    cpuCores: 16, ramGb: 64,
  );

  final router = Enrutador(
    id: 'RTR-01', nombre: 'core-router',
    interfaces: ['eth0', 'eth1', 'eth2', 'eth3'],
  );

  servidor.encender();
  servidor.instalarServicio('nginx');
  servidor.instalarServicio('postgresql');

  router.encender();
  router.registrarTrafico(125000);

  print('\n$servidor');
  print(router);
}