void main() {
  String nombre = 'Ana';

  String? apellido = null;
  apellido = 'García';

  String? ciudad;

  print(ciudad?.length);

  String resultado = ciudad ?? 'Sin ciudad';
  print(resultado);

  // String ciudadSegura = ciudad!;

  if (apellido != null) {
    print(apellido.length);
  }

  late String token;
  token = 'abc123';
  print(token);
}