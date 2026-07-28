// lib/screens/mp_pantalla_paso2.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'mp_inscripcion_dto.dart';

class MpPantallaPaso2 extends StatelessWidget {
  const MpPantallaPaso2({super.key});

  Future<List<MpInscripcionDto>> _fetchInscripciones() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista.asMap().entries.map((e) {
      final item = e.value as Map<String, dynamic>;
      final conferencias = ['Flutter Avanzado', 'Dart Masterclass', 'UI Design', 'Cloud Architecture', 'State Management'];
      final asistentes = ['Carlos Perez', 'Ana Gomez', 'Luis Torres', 'Maria Diaz', 'Sofia Ruiz'];
      final i = e.key % 5;
      return MpInscripcionDto(
        id:         item['id'] as int,
        conferencia: conferencias[i],
        asistente:  asistentes[i],
        motivo:     item['title'] as String,
        confirmado: item['completed'] as bool,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · Lista de inscripciones'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<MpInscripcionDto>>(
        future: _fetchInscripciones(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final inscripciones = snap.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text(
                          '${inscripciones.where((c) => c.confirmado).length} confirmadas'),
                      backgroundColor: Colors.indigo[100],
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                          '${inscripciones.where((c) => !c.confirmado).length} pendientes'),
                      backgroundColor: Colors.orange[100],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: inscripciones.length,
                  itemBuilder: (context, i) {
                    final c = inscripciones[i];
                    return ListTile(
                      leading: Icon(Icons.mic,
                          color: c.confirmado ? Colors.indigo : Colors.orange),
                      title: Text('${c.conferencia} - ${c.asistente}'),
                      subtitle: Text(c.motivo),
                      trailing: Chip(
                        label: Text(
                          c.confirmado ? 'Confirmado' : 'Pendiente',
                          style: const TextStyle(fontSize: 11),
                        ),
                        backgroundColor: c.confirmado
                            ? Colors.indigo[100]
                            : Colors.orange[100],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}