Future<LoggedUser> login(String username, String password);
  Future<LoggedUser> register(String username, String email, String password, String password2);
  Future<void>       logout();
  Future<void>       requestPasswordReset(String email);
  Future<void>       confirmPasswordReset({
    required String uid,
    required String token,
    required String newPassword,
    required String newPassword2,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
@@ -19,71 +26,41 @@ class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {

  AuthRemoteDatasourceImpl(this._dio, this._storage);

  // ... login, register, logout sin cambios ...

  @override
  Future<LoggedUser> login(String username, String password) async {
  Future<void> requestPasswordReset(String email) async {
    try {
      final res  = await _dio.post(
        '/auth/login/',
        data: {'username': username, 'password': password},
      );
      final data = res.data as Map<String, dynamic>;
      await _storage.saveTokens(data['access'] as String, data['refresh'] as String);
      await _storage.saveUser(
        id:       data['user_id'] as int,
        username: data['username'] as String,
        email:    data['email']    as String,
        isStaff:  data['is_staff'] as bool,
      await _dio.post(
        '/auth/password-reset/',
        data: {'email': email},
      );
      return LoggedUser.fromMap(data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<LoggedUser> register(
    String username,
    String email,
    String password,
    String password2,
  ) async {
  Future<void> confirmPasswordReset({
    required String uid,
    required String token,
    required String newPassword,
    required String newPassword2,
  }) async {
    try {
      final res = await _dio.post(
        '/auth/register/',
      await _dio.post(
        '/auth/password-reset/confirm/',
        data: {
          'username':  username,
          'email':     email,
          'password':  password,
          'password2': password2,
          'uid':           uid,
          'token':         token,
          'new_password':  newPassword,
          'new_password2': newPassword2,
        },
      );
      final data = res.data as Map<String, dynamic>;
      await _storage.saveTokens(data['access'] as String, data['refresh'] as String);
      await _storage.saveUser(
        id:       data['user_id'] as int,
        username: data['username'] as String,
        email:    data['email']    as String,
        isStaff:  data['is_staff'] as bool,
      );
      return LoggedUser.fromMap(data);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      final refresh = await _storage.getRefresh();
      if (refresh != null && refresh.isNotEmpty) {
        await _dio.post('/auth/logout/', data: {'refresh': refresh});
      }
    } catch (_) {
      // Si el logout falla en el servidor, limpiamos localmente igual
    } finally {
      await _storage.clearSession();
    }
  }
}