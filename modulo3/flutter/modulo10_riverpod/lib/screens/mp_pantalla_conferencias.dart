// lib/screens/mp_pantalla_conferencias.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mp_conferencias_provider.dart';
import '../models/mp_conferencia.dart';

class MpPantallaConferencias extends ConsumerWidget {
  const MpPantallaConferencias({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conferencias = ref.watch(mpConferenciasProvider);
    final cs           = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Conferencias (${conferencias.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: conferencias.isEmpty
          ? const Center(child: Text('Sin conferencias'))
          : ListView.separated(
              itemCount:        conferencias.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final c = conferencias[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: c.certificado
                        ? Colors.indigo.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.mic,
                        color: c.certificado ? Colors.indigo : Colors.grey),
                  ),
                  title:    Text(c.titulo,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${c.categoria} - ponente: ${c.ponente}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          c.favorito ? Icons.star : Icons.star_border,
                          color: c.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(mpConferenciasProvider.notifier)
                            .toggleFavorito(c.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(mpConferenciasProvider.notifier)
                            .eliminar(c.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(mpConferenciasProvider.notifier).agregar(
            MpConferencia(
              id:          id,
              titulo:      'nueva-conferencia-$id',
              categoria:   'Tecnología',
              ponente:     'Pendiente',
              capacidad:   50,
              certificado: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}