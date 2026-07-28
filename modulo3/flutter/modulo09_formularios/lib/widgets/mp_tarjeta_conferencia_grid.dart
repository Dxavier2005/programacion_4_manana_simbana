// lib/widgets/mp_tarjeta_conferencia_grid.dart
import 'package:flutter/material.dart';
import '../models/mp_conferencia.dart';

class MpTarjetaConferenciaGrid extends StatelessWidget {
  final MpConferencia conferencia;
  final VoidCallback   onFavorito;
  final VoidCallback   onEliminar;

  const MpTarjetaConferenciaGrid({
    super.key,
    required this.conferencia,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(
                Icons.mic,
                color: conferencia.favorito ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  conferencia.favorito ? Icons.star : Icons.star_border,
                  color: conferencia.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),
            Text(
              conferencia.titulo,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              conferencia.categoria,
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
            const Spacer(),
            Row(children: [
              if (conferencia.favorito)
                const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(Icons.star, size: 12, color: Colors.amber),
                ),
              Expanded(
                child: Text(
                  'Cap: ${conferencia.capacidad}',
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}