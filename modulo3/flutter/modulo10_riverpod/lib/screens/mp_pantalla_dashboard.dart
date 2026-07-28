// lib/screens/mp_pantalla_dashboard.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mp_pantalla_conferencias.dart';
import 'mp_pantalla_metricas.dart';

final mpIndiceTabProvider = StateProvider<int>((ref) => 0);

class MpPantallaDashboard extends ConsumerWidget {
  const MpPantallaDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indice = ref.watch(mpIndiceTabProvider);

    return Scaffold(
      body: switch (indice) {
        0 => const MpPantallaConferencias(),
        1 => const MpPantallaMetricas(),
        _ => const MpPantallaConferencias(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex:        indice,
        onDestinationSelected: (i) =>
            ref.read(mpIndiceTabProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(
            icon:        Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label:       'Conferencias',
          ),
          NavigationDestination(
            icon:        Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label:       'Métricas',
          ),
        ],
      ),
    );
  }
}