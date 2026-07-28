// lib/providers/mp_conferencias_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mp_conferencia.dart';

class MpConferenciasNotifier extends Notifier<List<MpConferencia>> {
  @override
  List<MpConferencia> build() => [
    MpConferencia(id:'1', titulo:'Keynote IA',     categoria:'Inteligencia Artificial', ponente:'Ana Gómez',    capacidad:150, certificado:true,  favorito:true),
    MpConferencia(id:'2', titulo:'Cloud Tech',     categoria:'Cloud Computing',         ponente:'Carlos Pérez', capacidad:100, certificado:true),
    MpConferencia(id:'3', titulo:'Cybersecurity',  categoria:'Seguridad',               ponente:'Luis Torres',  capacidad:80,  certificado:false),
  ];

  void toggleFavorito(String id) {
    state = state.map((c) =>
        c.id == id
          ? MpConferencia(id:c.id, titulo:c.titulo, categoria:c.categoria,
                        ponente:c.ponente, capacidad:c.capacidad, certificado:c.certificado,
                        favorito:!c.favorito)
          : c
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((c) => c.id != id).toList();
  }

  void agregar(MpConferencia conferencia) {
    state = [...state, conferencia];
  }
}

final mpConferenciasProvider =
    NotifierProvider<MpConferenciasNotifier, List<MpConferencia>>(
  MpConferenciasNotifier.new,
);

final mpBusquedaProvider = StateProvider<String>((ref) => '');

final mpConferenciasFiltradasProvider = Provider<List<MpConferencia>>((ref) {
  final busqueda = ref.watch(mpBusquedaProvider).toLowerCase();
  final conferencias = ref.watch(mpConferenciasProvider);
  if (busqueda.isEmpty) return conferencias;
  return conferencias.where((c) =>
    c.titulo.toLowerCase().contains(busqueda) ||
    c.categoria.toLowerCase().contains(busqueda) ||
    c.ponente.toLowerCase().contains(busqueda)
  ).toList();
});