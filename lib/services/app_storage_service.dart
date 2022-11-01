import 'package:shared_preferences/shared_preferences.dart';

class AppStorageService {

  late final SharedPreferences storage;

  AppStorageService() {
    storage = SharedPreferences.getInstance() as SharedPreferences;
  }

  void set() async {

  }

}