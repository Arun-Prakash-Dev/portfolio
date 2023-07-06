import 'dart:core';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/Colors.dart';

class ProjectCard extends StatefulWidget {
  final int index;

  const ProjectCard({super.key, required this.index});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  List<String> repos = [
    'WhatsApp UI clone',
    'Cowin Slot Finder',
    'Wallpaper Hub App',
    'Black Hole Animation',
  ];

  final List<String> _url = [
    'https://github.com/Arun-Prakash-Dev/WhatsApp-UI-Clone--Flutter',
    'https://github.com/Arun-Prakash-Dev/Cowin-Slot-Finder-App',
    'https://github.com/Arun-Prakash-Dev/WALLPAPER_HUB',
    'https://github.com/Arun-Prakash-Dev/Black-Hole-animation',
  ];

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_url[widget.index]))) {
      throw Exception('Could not launch ${_url[widget.index]}');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Container(
          width: 300,
          height: 100,
          child: Card(
            elevation: 2.0,
            color: Colors.black,
            shadowColor: Colors.black87,
            surfaceTintColor: Colors.black54,
            borderOnForeground: false,
            child: InkWell(
              mouseCursor: SystemMouseCursors.none,
              onTap: () => _launchUrl(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) =>
                          textGradient.createShader(bounds),
                      child: Text(
                        repos[widget.index],
                        style: const TextStyle(
                          //color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
