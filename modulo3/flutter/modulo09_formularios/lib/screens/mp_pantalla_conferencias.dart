// lib/screens/mp_pantalla_conferencias.dart
import 'package:flutter/material.dart';
import '../models/mp_conferencia.dart';
import '../widgets/mp_fila_conferencia.dart';
import '../widgets/mp_tarjeta_conferencia_grid.dart';

class MpPantallaConferencias extends StatefulWidget {
  const MpPantallaConferencias({super.key});
  @override
  State<MpPantallaConferencias> createState() => _MpPantallaConferenciasState();
}

class _MpPantallaConferenciasState extends State<MpPantallaConferencias> {
  final _conferencias = [
    MpConferencia(id:'1', titulo:'Keynote IA',     categoria:'Inteligencia Artificial', salon:'Auditorio A', capacidad:150, ponente:'Ana Gomez',    contacto:'0991234567', favorito:true),
    MpConferencia(id:'2', titulo:'Cloud Tech',     categoria:'Cloud Computing',         salon:'Auditorio B', capacidad:100, ponente:'Carlos Perez', contacto:'0987654321'),
    MpConferencia(id:'3', titulo:'Cybersecurity',  categoria:'Seguridad',               salon:'Salon C',     capacidad:80,  ponente:'Luis Torres',  contacto:'0976543210'),
    MpConferencia(id:'4', titulo:'UX/UI Design',   categoria:'Diseno',                  salon:'Salon D',     capacidad:60,  ponente:'Maria Diaz',   contacto:'0965432109'),
  ];

  bool _modoGrid = false;

  void _toggleFavorito(int i) =>
      setState(() => _conferencias[i].favorito = !_conferencias[i].favorito);

  void _eliminar(int i) => setState(() => _conferencias.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Conferencias (${_conferencias.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadricula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _conferencias.length,
              itemBuilder: (ctx, i) => MpTarjetaConferenciaGrid(
                conferencia: _conferencias[i],
                onFavorito:  () => _toggleFavorito(i),
                onEliminar:  () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _conferencias.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => MpFilaConferencia(
                conferencia: _conferencias[i],
                onFavorito:  () => _toggleFavorito(i),
                onEliminar:  () => _eliminar(i),
              ),
            ),
    );
  }
}