import 'package:flutter/material.dart';
import 'package:modulo06_widgets/screens/mp_pantalla_contexto.dart';
import 'package:modulo06_widgets/widgets/mp_catalogo_basicos.dart';
import 'package:modulo06_widgets/widgets/mp_contador_limitado.dart';
import 'package:modulo06_widgets/widgets/mp_etiqueta.dart';
import 'package:modulo06_widgets/widgets/mp_indicador.dart';
import 'package:modulo06_widgets/widgets/mp_reloj.dart';
import 'package:modulo06_widgets/widgets/mp_servicio_estado.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo                         │
// │  3  Paso 2   StatelessWidget con parámetros                     │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus      │
// │  5  Paso 3b  Parámetros en StatefulWidget                       │
// │  6  Paso 4   Ciclo de vida con Timer                            │
// │  7  Paso 5   BuildContext                                       │
// │  8  Paso 6   Composición de widgets                             │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 7;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: MpSaludo())),
    2 => const MpCatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            MpEtiqueta(texto: 'Confirmado', color: Colors.green),
            MpEtiqueta(texto: 'Cancelado', color: Colors.red, relleno: true),
            MpEtiqueta(texto: 'En espera', color: Colors.orange),
            MpEtiqueta(texto: 'VIP', color: Colors.deepPurple, fontSize: 16, relleno: true),
            MpEtiqueta(texto: 'Online', color: Colors.blue, fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: MpServicioEstado(nombre: 'Auditorio Principal - Conferencia IA'),
      ),
    ),
    5 => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MpContadorLimitado(
              etiqueta: 'Entradas VIP vendidas',
              limite: 20,
              color: Colors.deepPurple,
              textoBoton: 'Comprar VIP',
              onLimite: () => debugPrint('¡Entradas VIP agotadas!'),
            ),
            const SizedBox(height: 40),
            const MpContadorLimitado(
              etiqueta: 'Asistentes en sala',
              limite: 100,
              color: Colors.indigo,
              textoBoton: 'Registrar entrada',
            ),
            const SizedBox(height: 40),
            const MpIndicador(
              label: 'Aforo Total Registrado',
              valor: '350',
              color: Colors.deepPurple,
              subtitulo: 'Meta: 500 asistentes',
              icono: Icons.people_alt,
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(
      appBar: AppBar(title: const Text('Cronómetro de Conferencia')),
      body: const Center(child: MpReloj()),
    ),
    7 => const MpPantallaContexto(),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class MpSaludo extends StatelessWidget {
  const MpSaludo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectableText(
      'Bienvenido a Eventos App - Gestión de Conferencias',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.deepPurple,
        shadows: [
          Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(4, 4)),
        ],
      ),
      textAlign: TextAlign.center,
      maxLines: 3,
    );
  }
}