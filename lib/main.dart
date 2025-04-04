import 'package:flutter/material.dart';
import 'package:notice_app_isar/models/note_database.dart';
import 'package:notice_app_isar/screens/home_page.dart';
import 'package:notice_app_isar/themes/themeprovider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //initializing the isar database
  WidgetsFlutterBinding.ensureInitialized();
  final noteDatabase = NoteDatabase();
  await noteDatabase.init();

  runApp(
    //multi provider is used to provide multiple providers at once
    MultiProvider(
      providers: [
        //* ChangeNotifierProvider is used to provide the NoteDatabase
        ChangeNotifierProvider<NoteDatabase>(create: (context) => noteDatabase),

        //* ChangeNotifierProvider is used to provide the Themeprovider
        ChangeNotifierProvider<Themeprovider>(create: (context) => Themeprovider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<Themeprovider>(context).themeData,
    );
  }
}
