import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AleatoryNumbersHivePage extends StatefulWidget {
  const AleatoryNumbersHivePage({Key? key}) : super(key: key);

  @override
  createState() => _AleatoryNumbersHivePageState();
}

class _AleatoryNumbersHivePageState extends State<AleatoryNumbersHivePage> {
  late Box storageBox;

  int? clickedTimes = 0;
  int? savedNumber = 0;

  @override
  void initState() {
    super.initState();
    loadPreferences();
  }

  void loadPreferences() async {
    if (Hive.isBoxOpen('box_aleatory_numbers')) {
      storageBox = Hive.box('box_aleatory_numbers');
    } else {
      storageBox = await Hive.openBox('box_aleatory_numbers');
    }

    setState(() {
      savedNumber = storageBox.get('aleatory_number') ?? 0 ;
      clickedTimes = storageBox.get('clicked_times') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Aleatory Numbers Hive"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Clear Storage',
              onPressed: () {
                setState(() {
                  savedNumber = null;
                  clickedTimes = null;
                  storageBox.delete("aleatory_number");
                  storageBox.delete("clicked_times");
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

              storageBox.put("aleatory_number", savedNumber!);
              storageBox.put("clicked_times", clickedTimes!);
            }),
      ),
    );
  }
}
