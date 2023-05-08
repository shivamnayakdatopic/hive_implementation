import 'package:flutter/material.dart';
import 'package:fluttter_hive/home_screen.dart';
import 'package:fluttter_hive/models/notes_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // This is also important to initialize. 
  WidgetsFlutterBinding.ensureInitialized();
  // We are getting directory for store all data in local app.
  var directory = await getApplicationDocumentsDirectory();
  // Initialize hive database in your application. 
  Hive.init(directory.path);

  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notes');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Hive',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: HomeScreen());
  }
}
