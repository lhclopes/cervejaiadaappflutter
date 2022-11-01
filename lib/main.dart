import 'package:cervejaiadaappflutter/app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();

  Hive.init(documentsDirectory.path);

  await dotenv.load(
      fileName: ".env",
      mergeWith: {}); // mergeWith optional, you can include Platform.environment for Mobile/Desktop app

  debugPrint(dotenv.get("MARVELPUBLICKEY"));

  runApp(const CervejaiadaApp());
}
