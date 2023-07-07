import 'package:flutter/material.dart';

import 'Layouts/Desktop_Scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DesktopScaffold(),
      theme: ThemeData.dark().copyWith(
        iconTheme: const IconThemeData(color: Colors.white),
        useMaterial3: true,
      ),
    );
  }
}
