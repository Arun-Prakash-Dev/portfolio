import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/project_card.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      thumbVisibility: true,
      child: Container(
        constraints: BoxConstraints(minHeight: 100),
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProjectCard(index: 0),
                ProjectCard(index: 1),
                ProjectCard(index: 2),
                ProjectCard(index: 3),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
