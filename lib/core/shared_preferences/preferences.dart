import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _singleton = Preferences._();
  factory Preferences() => _singleton;

  Preferences._();

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get userUUID => _prefs.getString("useruuid") ?? "";
  set userUUID(String value) => _prefs.setString("useruuid", value);

  double get porcentajeRutina => _prefs.getDouble("porcentajeRutina") ?? 0.0;
  set porcentajeRutina(double value) =>
      _prefs.setDouble("porcentajeRutina", value);

  double get porcentajeDieta => _prefs.getDouble("porcentajeDouble") ?? 0.0;
  set porcentajeDieta(double value) =>
      _prefs.setDouble("porcentajeDouble", value);
}
