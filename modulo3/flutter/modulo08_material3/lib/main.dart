// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/mp_pantalla_tema.dart';
import 'screens/mp_pantalla_appbar.dart';
import 'widgets/mp_catalogo_botones.dart';
import 'screens/mp_pantalla_navegacion.dart';
import 'screens/mp_pantalla_dialogs.dart';

const int paso = 6;

void main() => runApp(const MpAppEventos());

class MpAppEventos extends StatefulWidget {
  const MpAppEventos({super.key});
  @override
  State<MpAppEventos> createState() => _MpAppEventosState();
}

class _MpAppEventosState extends State<MpAppEventos> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF3F51B5);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _MpPaso1(),
        2 => MpPantallaTema(
               themeMode: _themeMode,
               onToggle:  (mode) => setState(() => _themeMode = mode),
             ),
        3 => const MpPantallaAppBar(),
        4 => const MpCatalogoBotones(),
        5 => const MpPantallaNavegacion(),
        6 => const MpPantallaDialogs(),
        _ => Scaffold(body: Center(child: Text('Paso $paso no definido'))),
      },
    );
  }
}

class _MpPaso1 extends StatelessWidget {
  const _MpPaso1();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:          const Text('Eventos App - Gestión de Conferencias'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.event, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Tech Summit 2026',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Organizador: Ana Gómez · Auditorio Principal',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.mic),
              label: const Text('Iniciar conferencia'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}