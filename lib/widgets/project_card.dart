import 'dart:core';

import 'package:flutter/material.dart';
import 'package:my_portfolio/config/Hovering.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final int index;

  const ProjectCard({super.key, required this.index});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with TickerProviderStateMixin {
  List<String> repos = [
    'WhatsApp UI clone',
    'Cowin Slot Finder',
    'Wallpaper Hub App',
    'Black Hole Animation',
  ];

  List<String> descriptions = [
    'A whatsapp clone app made in flutter',
    'A cowin api integrated app to find the number of slots for vaccination in India.',
    'An Android mobile application developed in Flutter to download and set wallpapers for your Home and lock screen using PIXABAY API.',
    'Animation created using Tween Animations from flutter, where a box will fall in to a black hole on pressing the "+" button and will be reversed when pressing "-" button.'
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

  Duration duration = const Duration(milliseconds: 200);

  late final colorAnimationController =
      AnimationController(vsync: this, duration: duration);

  late final textColorAnimationController = AnimationController(
    vsync: this,
    duration: duration,
  );

  late final containerSizeAnimationController = AnimationController(
    vsync: this,
    duration: duration,
  );

  final textColorTween = ColorTween(begin: Colors.white, end: Colors.black);
  final colorTween = ColorTween(begin: Colors.black, end: Colors.white);
  final containerSizeTween = Tween<double>(begin: 1, end: 2);

  Color? get color => colorTween.evaluate(colorAnimationController);
  Color? get textColor => textColorTween.evaluate(textColorAnimationController);
  double get containerSize =>
      containerSizeTween.evaluate(containerSizeAnimationController);

  @override
  void initState() {
    colorAnimationController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    colorAnimationController.dispose();
    textColorAnimationController.dispose();
    containerSizeAnimationController.dispose();
    super.dispose();
  }

  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Container(
          width: 300,
          // height: 100 * containerSize,
          constraints:
              BoxConstraints(minHeight: 100 * containerSize, minWidth: 300),
          child: Card(
            color: color,
            child: InkWell(
              onHover: (value) {
                if (value) {
                  setState(() {
                    _isHovering = true;
                    Hovering.hovering = true;
                    // print(Hovering.hovering);
                  });
                  colorAnimationController.forward();
                  textColorAnimationController.forward();
                  containerSizeAnimationController.forward();
                } else {
                  setState(() {
                    _isHovering = false;
                    Hovering.hovering = false;
                  });
                  colorAnimationController.reverse();
                  textColorAnimationController.reverse();
                  containerSizeAnimationController.reverse();
                }
              },
              mouseCursor: SystemMouseCursors.none,
              onTap: () => _launchUrl(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: _isHovering
                          ? Column(
                              children: [
                                Text(
                                  repos[widget.index],
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    descriptions[widget.index],
                                    style: TextStyle(
                                      color: textColor,
                                      letterSpacing: 2.0,
                                      wordSpacing: 3.0,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              repos[widget.index],
                              style: TextStyle(
                                color: textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
