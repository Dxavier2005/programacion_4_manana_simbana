// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/mp_formulario_conferencia.dart';
import 'models/mp_conferencia.dart';
import 'widgets/mp_fila_conferencia.dart';
import 'screens/mp_pantalla_conferencias.dart';
import 'screens/mp_pantalla_busqueda.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF3F51B5),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _MpPaso1(),
    2 => const _MpPaso2(),
    3 => const _MpPaso3(),
    4 => const MpPantallaConferencias(),
    5 => const MpPantallaBusqueda(),

    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class _MpPaso1 extends StatefulWidget {
  const _MpPaso1();
  @override
  State<_MpPaso1> createState() => _MpPaso1State();
}

class _MpPaso1State extends State<_MpPaso1> {
  final _ctrlTitulo    = TextEditingController();
  final _ctrlCategoria = TextEditingController();
  final _ctrlCapacidad = TextEditingController(text: '50');
  final _ctrlPonente   = TextEditingController(text: 'Ana Gómez');
  final _focusCategoria = FocusNode();
  final _focusCapacidad = FocusNode();

  @override
  void dispose() {
    _ctrlTitulo.dispose();
    _ctrlCategoria.dispose();
    _ctrlCapacidad.dispose();
    _ctrlPonente.dispose();
    _focusCategoria.dispose();
    _focusCapacidad.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Registro de conferencia'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlTitulo,
              decoration:      const InputDecoration(
                labelText:  'Título',
                hintText:   'Keynote IA',
                prefixIcon: Icon(Icons.event),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusCategoria.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlCategoria,
              focusNode:       _focusCategoria,
              decoration:      const InputDecoration(
                labelText:  'Categoría',
                hintText:   'Inteligencia Artificial, Cloud...',
                prefixIcon: Icon(Icons.category),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusCapacidad.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlCapacidad,
              focusNode:   _focusCapacidad,
              decoration:  const InputDecoration(
                labelText:  'Capacidad (asistentes)',
                prefixIcon: Icon(Icons.groups),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Registrando a ${_ctrlTitulo.text} '
                      '(${_ctrlCategoria.text} - ${_ctrlCapacidad.text} asistentes)',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.mic),
              label: const Text('Registrar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlTitulo.clear();
                _ctrlCategoria.clear();
                _ctrlCapacidad.text = '50';
                _ctrlPonente.text = 'Ana Gómez';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MpPaso2 extends StatelessWidget {
  const _MpPaso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nueva conferencia'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: MpFormularioConferencia(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['titulo']} — ${datos['categoria']} (${datos['capacidad']} asistentes)'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _MpPaso3 extends StatefulWidget {
  const _MpPaso3();
  @override
  State<_MpPaso3> createState() => _MpPaso3State();
}

class _MpPaso3State extends State<_MpPaso3> {
  final _conferencias = [
    MpConferencia(id:'1', titulo:'Keynote IA',     categoria:'Inteligencia Artificial', salon:'Auditorio A', capacidad:150, ponente:'Ana Gomez',    contacto:'0991234567', favorito:true),
    MpConferencia(id:'2', titulo:'Cloud Tech',     categoria:'Cloud Computing',         salon:'Auditorio B', capacidad:100, ponente:'Carlos Perez', contacto:'0987654321'),
    MpConferencia(id:'3', titulo:'Cybersecurity',  categoria:'Seguridad',               salon:'Salon C',     capacidad:80,  ponente:'Luis Torres',  contacto:'0976543210'),
    MpConferencia(id:'4', titulo:'UX/UI Design',   categoria:'Diseno',                  salon:'Salon D',     capacidad:60,  ponente:'Maria Diaz',   contacto:'0965432109'),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Conferencias (${_conferencias.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _conferencias.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.event_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin conferencias',
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _conferencias.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => MpFilaConferencia(
                conferencia: _conferencias[i],
                onFavorito:  () => setState(() =>
                    _conferencias[i].favorito = !_conferencias[i].favorito),
                onEliminar:  () => setState(() => _conferencias.removeAt(i)),
              ),
            ),
    );
  }
}