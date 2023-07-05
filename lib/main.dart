import 'package:flutter/material.dart';

import 'Layouts/Desktop_Scaffold.dart';
import 'Layouts/Mobile_Scaffold.dart';
import 'Layouts/Responsive_Layouts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
      ),
    );
  }
}
