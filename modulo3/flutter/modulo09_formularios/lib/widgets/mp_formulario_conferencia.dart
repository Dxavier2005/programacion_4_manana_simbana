// lib/widgets/mp_formulario_conferencia.dart
import 'package:flutter/material.dart';

class MpFormularioConferencia extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const MpFormularioConferencia({super.key, required this.onGuardar});

  @override
  State<MpFormularioConferencia> createState() => _MpFormularioConferenciaState();
}

class _MpFormularioConferenciaState extends State<MpFormularioConferencia> {
  final _formKey  = GlobalKey<FormState>();

  final _ctrlTitulo    = TextEditingController();
  final _ctrlCategoria = TextEditingController();
  final _ctrlSalon     = TextEditingController();
  final _ctrlCapacidad = TextEditingController(text: '50');
  final _ctrlPonente   = TextEditingController();

  final _focusCategoria = FocusNode();
  final _focusSalon     = FocusNode();
  final _focusCapacidad = FocusNode();
  final _focusPonente   = FocusNode();

  String _tipoEvento = 'Presencial';
  String _estadoCupos = 'Disponible';
  bool   _certificado = true;

  @override
  void dispose() {
    _ctrlTitulo.dispose();
    _ctrlCategoria.dispose();
    _ctrlSalon.dispose();
    _ctrlCapacidad.dispose();
    _ctrlPonente.dispose();
    _focusCategoria.dispose();
    _focusSalon.dispose();
    _focusCapacidad.dispose();
    _focusPonente.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'titulo':     _ctrlTitulo.text,
      'categoria':  _ctrlCategoria.text,
      'salon':      _ctrlSalon.text,
      'capacidad':  _ctrlCapacidad.text,
      'ponente':    _ctrlPonente.text,
      'tipoEvento': _tipoEvento,
      'certificado': _certificado.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller:      _ctrlTitulo,
            decoration:      const InputDecoration(
              labelText:  'Título de la conferencia',
              hintText:   'Keynote IA',
              prefixIcon: Icon(Icons.event),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusCategoria.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El título es obligatorio';
              if (v.length < 2)                return 'Mínimo 2 caracteres';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlCategoria,
            focusNode:       _focusCategoria,
            decoration:      const InputDecoration(
              labelText:  'Categoría',
              hintText:   'Inteligencia Artificial, Cloud...',
              prefixIcon: Icon(Icons.category),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusSalon.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La categoría es obligatoria';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlSalon,
            focusNode:       _focusSalon,
            decoration:      const InputDecoration(
              labelText:  'Salón',
              hintText:   'Auditorio A, Sala VIP...',
              prefixIcon: Icon(Icons.meeting_room),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusCapacidad.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'El salón es obligatorio';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlCapacidad,
            focusNode:       _focusCapacidad,
            decoration:      const InputDecoration(
              labelText:  'Capacidad (asistentes)',
              prefixIcon: Icon(Icons.groups),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPonente.requestFocus(),
            validator: (v) {
              final capacidad = int.tryParse(v ?? '');
              if (capacidad == null)          return 'Debe ser un número';
              if (capacidad < 1 || capacidad > 1000) return 'Capacidad entre 1 y 1000';
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller:      _ctrlPonente,
            focusNode:       _focusPonente,
            decoration:      const InputDecoration(
              labelText:  'Nombre del ponente',
              prefixIcon: Icon(Icons.person_outline),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El ponente es obligatorio' : null,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value:        _tipoEvento,
            decoration: const InputDecoration(
              labelText:  'Modalidad',
              prefixIcon: Icon(Icons.devices),
              border:     OutlineInputBorder(),
            ),
            items: ['Presencial', 'Virtual', 'Híbrido']
                .map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _tipoEvento = v!),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value:        _estadoCupos,
            decoration: const InputDecoration(
              labelText:  'Estado de cupos',
              prefixIcon: Icon(Icons.info_outline),
              border:     OutlineInputBorder(),
            ),
            items: ['Disponible', 'Últimos cupos', 'Agotado']
                .map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _estadoCupos = v!),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title:     const Text('Certificado'),
            subtitle:  const Text('Incluye certificado de asistencia'),
            value:     _certificado,
            onChanged: (v) => setState(() => _certificado = v),
            secondary: const Icon(Icons.card_membership),
          ),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => _formKey.currentState?.reset(),
                child: const Text('Limpiar'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: FilledButton.icon(
                onPressed: _guardar,
                icon:  const Icon(Icons.save),
                label: const Text('Guardar conferencia'),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}