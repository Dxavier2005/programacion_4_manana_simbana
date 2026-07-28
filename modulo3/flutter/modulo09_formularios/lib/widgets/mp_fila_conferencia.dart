// lib/widgets/mp_fila_conferencia.dart
import 'package:flutter/material.dart';
import '../models/mp_conferencia.dart';

class MpFilaConferencia extends StatelessWidget {
  final MpConferencia conferencia;
  final VoidCallback   onFavorito;
  final VoidCallback   onEliminar;

  const MpFilaConferencia({
    super.key,
    required this.conferencia,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: conferencia.favorito
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.mic,
          color: conferencia.favorito ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        conferencia.titulo,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${conferencia.categoria} - ${conferencia.salon} - ponente: ${conferencia.ponente}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              conferencia.favorito ? Icons.star : Icons.star_border,
              color: conferencia.favorito ? Colors.amber : cs.outline,
            ),
            onPressed:     onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip:       conferencia.favorito ? 'Quitar favorito' : 'Agregar a favoritos',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}