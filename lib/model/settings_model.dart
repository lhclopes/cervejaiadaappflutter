class SettingsModel {
  String _username = "";
  bool _pushNotification = false;
  bool _darkTheme = false;

  SettingsModel.clean() {
    _username = "";
    _pushNotification = false;
    _darkTheme = false;
  }

  SettingsModel(this._username, this._pushNotification, this._darkTheme);

  String get username => _username;

  set username(String username) {
    _username = username;
  }

  bool get pushNotification => _pushNotification;

  set pushNotification(bool pushNotification) {
    _pushNotification = pushNotification;
  }

  bool get darkTheme => _darkTheme;

  set darkTheme(bool darkTheme) {
    _darkTheme = darkTheme;
  }
}
