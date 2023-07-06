import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/dashboard.dart';

class Mouse extends StatefulWidget {
  const Mouse({super.key});

  @override
  State<Mouse> createState() => _MouseState();
}

class _MouseState extends State<Mouse> with TickerProviderStateMixin {
  Offset? pointer = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (eve) {
        setState(() {
          pointer = eve.position;
        });
      },
      onEnter: (eve) {
        setState(() {
          pointer = eve.position;
        });
      },
      // onExit: (eve) {
      //   setState(() {
      //     pointer = Off;
      //   });
      // },
      child: Stack(
        children: [
          const Dashboard(),
          AnimatedPointer(
            pointerOffset: pointer!,
            radius: 15,
          ),
          AnimatedPointer(
            pointerOffset: pointer!,
            movementDuration: const Duration(milliseconds: 1),
            radius: 2,
          )
        ],
      ),
    );
  }
}

class AnimatedPointer extends StatelessWidget {
  const AnimatedPointer({
    super.key,
    this.movementDuration = const Duration(milliseconds: 500),
    this.radius = 30,
    required this.pointerOffset,
  });
  final Duration movementDuration;
  final Offset pointerOffset;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: movementDuration,
      curve: Curves.easeOutExpo,
      top: pointerOffset.dy,
      left: pointerOffset.dx,
      child: CustomPaint(
        painter: Pointer(radius),
      ),
    );
  }
}

class Pointer extends CustomPainter {
  final double radius;
  Pointer(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      const Offset(0, 0),
      radius,
      Paint()
        ..color = Colors.white
        ..blendMode = BlendMode.difference,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
