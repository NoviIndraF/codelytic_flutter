abstract class SharedPreferenceDataSource {
  Future<bool> setLocalToken (String token);
  Future<String> hasToken();
  Future<String> unsetToken();

  Future<String> saveToSharedpref (String name, String value);
  Future<String> getToSharedPref(String name);
  Future<String> deteleToSharedPref(String name);
}