// lib/screens/mp_pantalla_busqueda.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mp_conferencias_provider.dart';

class MpPantallaBusqueda extends ConsumerWidget {
  const MpPantallaBusqueda({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conferencias = ref.watch(mpConferenciasFiltradasProvider);
    final busqueda     = ref.watch(mpBusquedaProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Buscar conferencias')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SearchBar(
            hintText: 'Buscar por título, categoría o ponente...',
            leading:  const Icon(Icons.search),
            trailing: busqueda.isNotEmpty
                ? [IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () =>
                        ref.read(mpBusquedaProvider.notifier).state = '',
                  )]
                : null,
            onChanged: (v) =>
                ref.read(mpBusquedaProvider.notifier).state = v,
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        Expanded(
          child: conferencias.isEmpty
              ? const Center(child: Text('Sin resultados'))
              : ListView.builder(
                  itemCount:   conferencias.length,
                  itemBuilder: (_, i) => ListTile(
                    leading: const Icon(Icons.mic),
                    title:   Text(conferencias[i].titulo),
                    subtitle: Text('${conferencias[i].categoria} - ${conferencias[i].ponente}'),
                  ),
                ),
        ),
      ]),
    );
  }
}