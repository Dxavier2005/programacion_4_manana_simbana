void main() {
  // Conversiones numéricas
  int entero = 42;
  double precioEntrada = entero.toDouble();   // 42.0
  String idEvento = entero.toString();        // "42"

  // String → número
  int num1 = int.parse('123');                // 123
  double num2 = double.parse('3.14');         // 3.14

  // Conversión segura (no lanza excepción)
  int? codigoEvento = int.tryParse('abc');    // null
  double? tarifa = double.tryParse('99');      // 99.0

  // Verificar tipo con is (como en Kotlin)
  Object valor = 'Conferencia Flutter';
  if (valor is String) {
    print(valor.length);
  }

  // Cast explícito con as
  Object obj = 'Evento principal';
  String nombreEvento = obj as String;

  // Comprobar nulabilidad
  String? descripcionEvento = null;
  int longitud = descripcionEvento?.length ?? 0;
  print(longitud);

  // Números especiales en contexto de eventos
  print(double.infinity);     // capacidad ilimitada (teórico)
  print(double.nan);          // valor no definido
  print(double.maxFinite);    // límite máximo de representación
}

