import 'package:cervejaiadaappflutter/model/settings_model.dart';
import 'package:cervejaiadaappflutter/repositories/settings_repository.dart';
import 'package:flutter/material.dart';

class SettingsHivePage extends StatefulWidget {
  const SettingsHivePage({Key? key}) : super(key: key);

  @override
  createState() => _SettingsHivePageState();
}

class _SettingsHivePageState extends State<SettingsHivePage> {
  late SettingsRepository settingsRepository;
  SettingsModel settings = SettingsModel.clean();

  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    settingsRepository = await SettingsRepository.init();

    setState(() {
      settings = settingsRepository.load();

      usernameController.text = settings.username;
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
                    value: settings.pushNotification,
                    onChanged: (bool value) {
                      setState(() {
                        settings.pushNotification = value;
                      });
                    }),
                SwitchListTile(
                    title: const Text("Dark Theme"),
                    value: settings.darkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        settings.darkTheme = value;
                      });
                    }),
                TextButton(
                    onPressed: (() async {
                      settings.username = usernameController.text;

                      settingsRepository.save(settings);
                    }),
                    child: const Text("Save"))
              ],
            )),
      ),
    );
  }
}
