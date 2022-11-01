import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsSharedPreferencesPage extends StatefulWidget {
  const SettingsSharedPreferencesPage({Key? key}) : super(key: key);

  @override
  createState() => _SettingsSharedPreferencesPageState();
}

class _SettingsSharedPreferencesPageState
 extends State<SettingsSharedPreferencesPage> {
  late SharedPreferences storage;

  TextEditingController usernameController = TextEditingController();

  bool pushNotification = false;
  bool darkTheme = false;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    storage = await SharedPreferences.getInstance();

    setState(() {
      usernameController.text = storage.getString("settings.username") ?? "";
      pushNotification = storage.getBool("settings.push_notification") ?? true;
      darkTheme = storage.getBool("settings.dark_theme") ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: Container(
            alignment: Alignment.center,
            child: ListView(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username",
                    ),
                  ),
                ),
                SwitchListTile(
                    title: const Text("Push Notification"),
                    value: pushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        pushNotification = value;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Dark Theme"),
                    value: darkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        darkTheme = value;
                      });
                    }),
                TextButton(
                    onPressed: (() async {
                      await storage.setString(
                          "settings.username", usernameController.text);
                      await storage.setBool(
                          "settings.push_notification", pushNotification);
                      await storage.setBool("settings.dark_theme", darkTheme);
                    }),
                    child: const Text("Save"))
              ],
            )),
      ),
    );
  }
}
