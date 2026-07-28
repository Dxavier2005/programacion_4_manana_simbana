import 'package:flutter/material.dart';

class MpServicioEstado extends StatefulWidget {
  final String nombre;

  const MpServicioEstado({
    super.key,
    required this.nombre,
  });

  @override
  State<MpServicioEstado> createState() => _MpServicioEstadoState();
}

class _MpServicioEstadoState extends State<MpServicioEstado> {
  bool _activo = true;
  int _incidentes = 0;

  void _toggle() {
    setState(() {
      _activo = !_activo;
      if (!_activo) _incidentes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _activo ? Icons.sensors : Icons.sensors_off,
            size: 72,
            color: _activo ? Colors.green : Colors.red,
          ),
          const SizedBox(height: 8),
          Text(
            _activo ? 'Streaming Activo' : 'Transmisión Interrumpida',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: _activo ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: _toggle,
            icon: Icon(_activo ? Icons.stop : Icons.play_arrow),
            label: Text(_activo ? 'Detener Transmisión' : 'Iniciar Transmisión'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _activo ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
          const SizedBox(height: 12),
          Text('Incidentes de conexión: $_incidentes'),
        ],
      ),
    );
  }
}