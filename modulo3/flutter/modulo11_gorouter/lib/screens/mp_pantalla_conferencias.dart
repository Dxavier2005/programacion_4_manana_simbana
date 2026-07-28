// lib/screens/mp_pantalla_conferencias.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter/models/mp_conferencia.dart';

class MpPantallaConferencias extends StatelessWidget {
  const MpPantallaConferencias({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final conferencias = conferenciasSimuladas;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Conferencias'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount:   conferencias.length,
        itemBuilder: (context, i) => ListTile(
          leading: Icon(Icons.mic, color: conferencias[i].certificado ? Colors.indigo : Colors.grey),
          title:   Text(conferencias[i].titulo),
          subtitle: Text('${conferencias[i].categoria} - ponente: ${conferencias[i].ponente}'),
          onTap: () {
            context.push(
             '/conferencias/${conferencias[i].id}',
             extra: conferencias[i],
            );
          },
        ),
      ),
    );
  }
}