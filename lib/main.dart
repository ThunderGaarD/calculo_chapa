import 'package:calculo_chapa/telas/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRUPO RIBEIRO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.black38,
        appBarTheme: AppBarTheme(
          color: Colors.black87,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey,
          thickness: 2,
          indent: 20,
          endIndent: 20,
        ),
        primaryColor: Colors.black87,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.red[600],
            elevation: 5,
            side: BorderSide(
              color: Colors.black,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
