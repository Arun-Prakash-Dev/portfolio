import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProjectCard(index: 0),
          ProjectCard(index: 1),
          ProjectCard(index: 2)
        ],
      ),
    );
  }
}
