import 'package:cervejaiadaappflutter/model/settings_model.dart';
import 'package:hive/hive.dart';

class SettingsRepository {
  static late Box _box;

  SettingsRepository._create();

  static Future<SettingsRepository> init() async {
    if (Hive.isBoxOpen('settings')) {
      _box = Hive.box('settings');
    } else {
      _box = await Hive.openBox('settings');
    }

    return SettingsRepository._create();
  }

  void save(SettingsModel settingsModel) {
    _box.put('settings', {
      'username': settingsModel.username,
      'pushNotification': settingsModel.pushNotification,
      'darkTheme': settingsModel.darkTheme
    });
  }

  SettingsModel load() {
    var settings = _box.get('settings');

    if (settings == null) {
      return SettingsModel.clean();
    }

    return SettingsModel(settings['username'], settings['pushNotification'], settings['darkTheme']);
  }
}
