import 'dart:async';
import 'package:flutter/material.dart';

class MpReloj extends StatefulWidget {
  const MpReloj({super.key});

  @override
  State<MpReloj> createState() => _MpRelojState();
}

class _MpRelojState extends State<MpReloj> {
  Timer? _timer;
  int _segundos = 0;
  int charlas = 0;
  final List<int> _tiemposCharla = [];
  bool _pausado = false;

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void _iniciarTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (!mounted) return;
        setState(() {
          _segundos++;
        });
      },
    );
  }

  void _guardarParcial() {
    setState(() {
      charlas++;
      _tiemposCharla.add(_segundos);
    });
  }

  void _togglePausa() {
    setState(() {
      _pausado = !_pausado;
      if (_pausado) {
        _timer?.cancel();
      } else {
        _iniciarTimer();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatearTiempo(int total) {
    final h = total ~/ 3600;
    final m = (total % 3600) ~/ 60;
    final s = total % 60;
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  String get _formato => _formatearTiempo(_segundos);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Tiempo Transcurrido de Conferencia', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        Text(
          _formato,
          style: const TextStyle(
            fontSize: 40,
            fontFamily: 'monospace',
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton.icon(
              onPressed: _togglePausa,
              icon: Icon(_pausado ? Icons.play_arrow : Icons.pause),
              label: Text(_pausado ? 'Reanudar' : 'Pausar'),
            ),
            const SizedBox(width: 8),
            FilledButton(
              onPressed: _guardarParcial,
              child: const Text('Registrar Hito'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(_pausado ? 'Evento en pausa' : 'Conferencia en curso'),
      ],
    );
  }
}