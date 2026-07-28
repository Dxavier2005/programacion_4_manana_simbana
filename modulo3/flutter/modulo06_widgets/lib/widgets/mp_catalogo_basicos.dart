import 'package:flutter/material.dart';

class MpCatalogoBasicos extends StatelessWidget {
  const MpCatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets Básicos - Gestión de Eventos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Conferencia Tech Summit 2026',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Auditorio Principal - Asistentes registrados: 350 / 500',
            textAlign: TextAlign.justify,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
          const SizedBox(height: 8),
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'EN VIVO',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' - Inició hace 15 minutos',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const SelectableText(
            'Código de Acceso: EVT-2026-CONF9',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.event_available, size: 80, color: Theme.of(context).colorScheme.primary),
              const Icon(Icons.event_busy, size: 80, color: Colors.red),
              const Icon(Icons.warning_amber, size: 80, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(height: 32),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Inscribirse')),
              FilledButton(onPressed: () {}, child: const Text('Comprar Ticket')),
              OutlinedButton(onPressed: () {}, child: const Text('Detalles')),
              TextButton(onPressed: () {}, child: const Text('Ver Ponentes')),
              const ElevatedButton(onPressed: null, child: Text('Agotado')),
            ],
          ),
          const Divider(height: 32),
          Card(
            elevation: 0,
            color: Colors.deepPurple.shade50,
            child: ListTile(
              leading: const Icon(Icons.mic, color: Colors.deepPurple),
              title: const Text('Keynote: Inteligencia Artificial'),
              subtitle: const Text('Ponente: Dra. Sofía Valenzuela - Salón A'),
              trailing: TextButton(onPressed: () {}, child: const Text('Asistir')),
            ),
          ),
          const Divider(height: 32),
          Wrap(
            spacing: 8, runSpacing: 8,
            children: [
              const Chip(label: Text('Tecnología')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('Certificado Incluido'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                label: const Text('Streaming online'),
                selected: true,
                onSelected: (_) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}