// lib/screens/mp_pantalla_detalle.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/mp_conferencia.dart';

class MpPantallaDetalle extends StatelessWidget {
  final String        id;
  final MpConferencia? conferencia;

  const MpPantallaDetalle({super.key, required this.id, this.conferencia});

  @override
  Widget build(BuildContext context) {
    final c = conferencia ??
        conferenciasSimuladas.where((s) => s.id == id).firstOrNull;

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:              Text('Detalle: ${c?.titulo ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: c == null
          ? Center(child: Text('Conferencia $id no encontrada'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MpFila('ID',          c.id),
                  _MpFila('Título',      c.titulo),
                  _MpFila('Categoría',   c.categoria),
                  _MpFila('Ponente',     c.ponente),
                  _MpFila('Certificado', c.certificado ? 'Sí' : 'No'),
                  const SizedBox(height: 24),
                  Row(children: [
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon:  const Icon(Icons.arrow_back),
                      label: const Text('Volver'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: () => context.push('/conferencias/${c.id}/historial'),
                      icon:  const Icon(Icons.history),
                      label: const Text('Ver historial'),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

class _MpFila extends StatelessWidget {
  final String label;
  final String valor;
  const _MpFila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 80,
          child: Text(label,
              style: TextStyle(color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600, fontSize: 12)),
        ),
        Text(valor, style: const TextStyle(fontSize: 15)),
      ]),
    );
  }
}