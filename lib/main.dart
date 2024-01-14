import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/movie_list_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nextion Task',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black.withOpacity(0.9),
        primaryColor: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // Set the app bar color
        ),
      ),
      home: const MovieListWidget(),
    );
  }
}
