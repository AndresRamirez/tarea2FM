import 'package:shared_preferences/shared_preferences.dart';

/// Servicio de autenticación que maneja registro, login y sesión
/// usando SharedPreferences para persistencia local.
class AuthService {
  // Claves para SharedPreferences
  static const String _keyEmail = 'user_email';
  static const String _keyPassword = 'user_password';
  static const String _keyName = 'user_name';
  static const String _keyIsLoggedIn = 'is_logged_in';
  static const String _keyCurrentUser = 'current_user';

  /// Registra un nuevo usuario. Retorna null si tuvo éxito,
  /// o un mensaje de error si el correo ya está registrado.
  static Future<String?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    // Verificar si ya existe un usuario con ese correo
    final existingEmail = prefs.getString(_keyEmail);
    if (existingEmail != null &&
        existingEmail.toLowerCase() == email.toLowerCase()) {
      return 'Este correo ya está registrado. Intenta con otro.';
    }

    // Guardar datos del usuario
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyEmail, email.toLowerCase());
    await prefs.setString(_keyPassword, password);

    return null; // Sin error
  }

  /// Inicia sesión. Retorna null si tuvo éxito,
  /// o un mensaje de error en caso contrario.
  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final storedEmail = prefs.getString(_keyEmail);
    final storedPassword = prefs.getString(_keyPassword);
    final storedName = prefs.getString(_keyName);

    if (storedEmail == null) {
      return 'No existe ningún usuario registrado. Crea una cuenta primero.';
    }

    if (storedEmail != email.toLowerCase()) {
      return 'Correo no encontrado.';
    }

    if (storedPassword != password) {
      return 'Contraseña incorrecta.';
    }

    // Marcar sesión activa
    await prefs.setBool(_keyIsLoggedIn, true);
    await prefs.setString(_keyCurrentUser, storedName ?? email);

    return null; // Sin error
  }

  /// Obtiene el nombre del usuario actualmente logueado.
  static Future<String> getCurrentUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyCurrentUser) ?? 'Usuario';
  }

  /// Obtiene el correo del usuario actualmente logueado.
  static Future<String> getCurrentUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail) ?? '';
  }

  /// Cierra la sesión del usuario.
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, false);
    await prefs.remove(_keyCurrentUser);
  }
}
