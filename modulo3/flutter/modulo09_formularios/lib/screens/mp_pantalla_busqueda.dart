// lib/screens/mp_pantalla_busqueda.dart
import 'package:flutter/material.dart';
import '../models/mp_conferencia.dart';
import '../widgets/mp_fila_conferencia.dart';
import '../widgets/mp_tarjeta_conferencia_grid.dart';

class MpPantallaBusqueda extends StatefulWidget {
  const MpPantallaBusqueda({super.key});
  @override
  State<MpPantallaBusqueda> createState() => _MpPantallaBusquedaState();
}

class _MpPantallaBusquedaState extends State<MpPantallaBusqueda> {
  final _conferencias = [
    MpConferencia(id:'1', titulo:'Keynote IA',     categoria:'Inteligencia Artificial', salon:'Auditorio A', capacidad:150, ponente:'Ana Gomez',    contacto:'0991234567', favorito:true),
    MpConferencia(id:'2', titulo:'Cloud Tech',     categoria:'Cloud Computing',         salon:'Auditorio B', capacidad:100, ponente:'Carlos Perez', contacto:'0987654321'),
    MpConferencia(id:'3', titulo:'Cybersecurity',  categoria:'Seguridad',               salon:'Salon C',     capacidad:80,  ponente:'Luis Torres',  contacto:'0976543210'),
    MpConferencia(id:'4', titulo:'UX/UI Design',   categoria:'Diseno',                  salon:'Salon D',     capacidad:60,  ponente:'Maria Diaz',   contacto:'0965432109'),
  ];

  String _busqueda = '';
  bool   _modoGrid = false;

  List<MpConferencia> get _filtrados => _conferencias
      .where((c) =>
          c.titulo.toLowerCase().contains(_busqueda.toLowerCase()) ||
          c.categoria.toLowerCase().contains(_busqueda.toLowerCase()) ||
          c.ponente.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleFavorito(MpConferencia c) =>
      setState(() => c.favorito = !c.favorito);

  void _eliminar(MpConferencia c) =>
      setState(() => _conferencias.removeWhere((x) => x.id == c.id));

  @override
  Widget build(BuildContext context) {
    final cs        = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Conferencias (${_conferencias.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:       Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip:   _modoGrid ? 'Vista lista' : 'Vista cuadricula',
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por título, categoría o ponente...',
              leading:  const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon:      const Icon(Icons.clear),
                        onPressed: () => setState(() => _busqueda = ''),
                      ),
                    ]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off,
                            size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => setState(() => _busqueda = ''),
                          child: const Text('Limpiar busqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:   2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing:  8,
                        ),
                        itemCount:   filtrados.length,
                        itemBuilder: (ctx, i) => MpTarjetaConferenciaGrid(
                          conferencia: filtrados[i],
                          onFavorito:  () => _toggleFavorito(filtrados[i]),
                          onEliminar:  () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount:        filtrados.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => MpFilaConferencia(
                          conferencia: filtrados[i],
                          onFavorito:  () => _toggleFavorito(filtrados[i]),
                          onEliminar:  () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}