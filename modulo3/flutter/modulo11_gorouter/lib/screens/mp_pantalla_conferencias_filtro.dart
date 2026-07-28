// lib/screens/mp_pantalla_conferencias_filtro.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/mp_conferencia.dart';

class MpPantallaConferenciasFiltro extends StatelessWidget {
  final bool soloCertificados;
  const MpPantallaConferenciasFiltro({super.key, this.soloCertificados = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloCertificados
        ? conferenciasSimuladas.where((c) => c.certificado).toList()
        : conferenciasSimuladas;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Conferencias${soloCertificados ? ' (Certificados)' : ''}'),
        actions: [
          IconButton(
            icon:    Icon(soloCertificados ? Icons.card_membership : Icons.card_membership_outlined),
            tooltip: soloCertificados ? 'Ver todos' : 'Solo certificados',
            onPressed: () => soloCertificados
                ? context.go('/conferencias')
                : context.go('/conferencias?soloCertificados=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final c = filtrados[i];
          return ListTile(
            leading: Icon(Icons.mic, color: c.certificado ? Colors.indigo : Colors.grey),
            title:   Text(c.titulo),
            subtitle: Text('${c.categoria} - ponente: ${c.ponente}'),
            onTap: () => context.push(
              '/conferencias/${c.id}',
              extra: c,
            ),
          );
        },
      ),
    );
  }
}