import 'package:codelytic/data/datasource/local/shared_preference_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataSourceImpl implements SharedPreferenceDataSource{
  Future<SharedPreferences> prefs =SharedPreferences.getInstance();

  @override
  Future<bool> setLocalToken(String token) async {
    try{
      final local = await prefs;
      local.setString("token", token);
      return true;
    }
    catch(e){
      return false;
    }
  }

  @override
  Future<String> hasToken() async {
    final local = await prefs;
    final String token = local.getString("token") ?? "";
    if(token.isEmpty){
      return "";
    }
    return token;
  }

  @override
  Future<String> unsetToken() async {
    final local = await prefs;
    local.setString("token", "");
    return "success";
  }

  @override
  Future<String> saveToSharedpref(String name, String value) async {
    try{
      final local = await prefs;
      local.setString(name, value);
      return value;
    }
    catch(e){
      return value;
    }
  }

  @override
  Future<String> getToSharedPref(String name) async {
    final local = await prefs;
    final String value = local.getString(name) ?? "";
    if(value.isEmpty){
      return "";
    }
    return value;
  }

  @override
  Future<String> deteleToSharedPref(String name) async {
    final local = await prefs;
    local.setString(name, "");
    return "success";
  }




}