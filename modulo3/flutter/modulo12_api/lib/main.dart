// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'mp_pantalla_paso1.dart';
import 'mp_pantalla_paso1_asistente.dart';
import 'mp_pantalla_paso2.dart';

class MpPantallaTemporal extends StatelessWidget {
  final String titulo;
  const MpPantallaTemporal({required this.titulo, super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(titulo)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.hourglass_empty, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            '$titulo\nPróximamente...',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            label: const Text('Volver al menú'),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    ),
  );
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, __) => const MpPantallaMenu()),
    GoRoute(path: '/paso1', builder: (_, __) => const MpPantallaPaso1()),
    GoRoute(path: '/paso1b', builder: (_, __) => const MpPantallaPaso1Asistente()),
    GoRoute(path: '/paso2', builder: (_, __) => const MpPantallaPaso2()),
    GoRoute(path: '/paso3', builder: (_, __) => const MpPantallaTemporal(titulo: 'Paso 3 · API real')),
    GoRoute(path: '/paso4', builder: (_, __) => const MpPantallaTemporal(titulo: 'Paso 4 · Errores tipados')),
    GoRoute(path: '/paso5', builder: (_, __) => const MpPantallaTemporal(titulo: 'Paso 5 · Arquitectura completa')),
  ],
);

void main() => runApp(const ProviderScope(child: MpAppConferenciasApi()));

class MpAppConferenciasApi extends StatelessWidget {
  const MpAppConferenciasApi({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F51B5)),
      useMaterial3: true,
    ),
  );
}

class MpPantallaMenu extends StatelessWidget {
  const MpPantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const pasos = [
      _MpPasoInfo(
        ruta: '/paso1',
        titulo: 'Paso 1',
        subtitulo: 'FutureBuilder crudo',
        detalle: 'http.get() + FutureBuilder · Inscripción individual',
        icono: Icons.event_seat,
        color: Colors.indigo,
      ),
      _MpPasoInfo(
        ruta: '/paso1b',
        titulo: 'Paso 1b',
        subtitulo: 'FutureBuilder Users',
        detalle: 'Asistente individual desde API',
        icono: Icons.person,
        color: Colors.teal,
      ),
      _MpPasoInfo(
        ruta: '/paso2',
        titulo: 'Paso 2',
        subtitulo: 'DTO simple',
        detalle: 'MpInscripcionDto.fromJson · lista de inscripciones',
        icono: Icons.list_alt,
        color: Colors.blue,
      ),
      _MpPasoInfo(
        ruta: '/paso3',
        titulo: 'Paso 3',
        subtitulo: 'API real + modelo',
        detalle: 'ProductoDto · toDomain()',
        icono: Icons.shopping_bag,
        color: Colors.orange,
      ),
      _MpPasoInfo(
        ruta: '/paso4',
        titulo: 'Paso 4',
        subtitulo: 'Errores tipados',
        detalle: 'sealed ApiError · Result<T>',
        icono: Icons.error_outline,
        color: Colors.red,
      ),
      _MpPasoInfo(
        ruta: '/paso5',
        titulo: 'Paso 5',
        subtitulo: 'Arquitectura completa',
        detalle: 'HttpClient · Repository · Riverpod Notifier',
        icono: Icons.architecture,
        color: Colors.purple,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos AP - API REST'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: pasos.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final p = pasos[i];
          return Card(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: p.color,
                radius: 24,
                child: Icon(p.icono, color: Colors.white),
              ),
              title: Text(
                '${p.titulo} · ${p.subtitulo}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  p.detalle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(p.ruta),
            ),
          );
        },
      ),
    );
  }
}

class _MpPasoInfo {
  final String ruta;
  final String titulo;
  final String subtitulo;
  final String detalle;
  final IconData icono;
  final Color color;
  const _MpPasoInfo({
    required this.ruta,
    required this.titulo,
    required this.subtitulo,
    required this.detalle,
    required this.icono,
    required this.color,
  });
}