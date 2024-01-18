import 'package:flutter/material.dart';
import 'package:odc/navigations/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lucky Trip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const NavigationTools(),
    );
  }
}

