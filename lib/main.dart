import 'package:flutter/material.dart';
import 'login_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.blue,
          primaryContainer: Colors.blue,
          secondary: Colors.black,
          onSecondaryContainer: Colors.black,
          secondaryContainer: Colors.black,
          onPrimaryContainer: Colors.white,
          // ignore: deprecated_member_use
          background: Color.fromARGB(0, 18, 18, 18),
          surface: Colors.blue,
          onSurfaceVariant: Colors.grey,
          //////////////
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.blue,
          ////
          onSurface: Colors.black,
          // ignore: deprecated_member_use
          onBackground: Colors.black,
          onError: Colors.red,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: LoginScreen(),
    );
  }
}
