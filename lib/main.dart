import 'package:flutter/material.dart';
import 'package:sqlapp/db/db_services.dart';
import 'package:sqlapp/screens/submit_screen.dart';
import 'package:sqlapp/screens/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dbServices.database();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserScreen(),
    );
  }
}
