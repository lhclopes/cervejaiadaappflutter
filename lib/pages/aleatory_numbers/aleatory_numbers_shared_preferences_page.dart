import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AleatoryNumbersSharedPreferencesPage extends StatefulWidget {
  const AleatoryNumbersSharedPreferencesPage({Key? key}) : super(key: key);

  @override
  createState() => _AleatoryNumbersSharedPreferencesPageState();
}

class _AleatoryNumbersSharedPreferencesPageState extends State<AleatoryNumbersSharedPreferencesPage> {
  late SharedPreferences storage;

  int? clickedTimes = 0;
  int? savedNumber = 0;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      savedNumber = storage.getInt("aleatory_number");
      clickedTimes = storage.getInt("clicked_times");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Aleatory Numbers"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Clear Storage',
              onPressed: () {
                setState(() {
                  savedNumber = null;
                  clickedTimes = null;
                  storage.remove("aleatory_number");
                  storage.remove("clicked_times");
                });
              },
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(savedNumber == null
                ? "Nothing aleatory Number"
                : savedNumber.toString()),
            Text(clickedTimes == null
                ? "Nothing Click"
                : clickedTimes.toString()),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              var random = Random();
              setState(() {
                savedNumber = random.nextInt(1000);
                clickedTimes = clickedTimes == null ? 1 : clickedTimes! + 1;
              });

              storage.setInt("aleatory_number", savedNumber!);
              storage.setInt("clicked_times", clickedTimes!);
            }),
      ),
    );
  }
}
