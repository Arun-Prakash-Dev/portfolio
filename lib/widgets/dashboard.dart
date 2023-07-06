import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/projects.dart';
import 'package:my_portfolio/widgets/social_media_card.dart';

import '../config/Colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      constraints: const BoxConstraints(minWidth: 200, minHeight: 800),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black54,
      child: CustomPaint(
        painter: BackgroundPainter(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 55,
                  backgroundImage: AssetImage('images/dp.jpeg'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Arun Prakash',
                  softWrap: true,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ),
              SocialMediaCard(),
              Center(
                child: SizedBox(
                  width: width / 3.5,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) =>
                          textGradient.createShader(bounds),
                      child: const Text(
                        'Learning to code is learning to create and innovate',
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(fontSize: 50),
                        //maxLines: 4,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Flutter Projects',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Projects(),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    List<Offset> points = [];

    int ratio = 46;
    int width = 1920;
    int height = 960;

    for (double i = width / ratio;
        i <= width * (ratio - 1) / ratio;
        i = i + width / ratio) {
      for (double j = height / ratio;
          j <= height * (ratio - 1) / ratio;
          j = j + height / ratio) {
        points.add(Offset(i, j));
      }
    }

    canvas.drawPoints(PointMode.points, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
