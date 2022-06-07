import 'package:flutter/material.dart';
import 'package:WorldTime/pages/choose_location.dart';
import 'package:WorldTime/pages/home.dart';
import 'package:WorldTime/pages/loading.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'services/save_preferrence.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Util.prefs = await SharedPreferences.getInstance();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}
