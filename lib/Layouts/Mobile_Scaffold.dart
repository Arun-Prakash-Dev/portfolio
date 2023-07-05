import 'package:flutter/material.dart';

import '../widgets/dashboard.dart';
import '../widgets/drawer_widget.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: const Dashboard(),
    );
  }
}
