import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/mouse_region.dart';

import '../widgets/dashboard.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black87,
      body: Mouse(),
    );
  }
}
