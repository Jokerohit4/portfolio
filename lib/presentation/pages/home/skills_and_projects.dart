import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/sections/projects_section.dart';
import 'package:nimbus/presentation/pages/home/sections/skills_section.dart';
import 'package:nimbus/presentation/pages/home/sections/statistics_section.dart';
import 'package:nimbus/values/values.dart';

class SkillsAndProjects extends StatelessWidget {
  const SkillsAndProjects(
      {super.key, required this.spacerHeight, required this.keyTwo});
  final double spacerHeight;
  final Key keyTwo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: assignWidth(context, 0.1),
          left: -assignWidth(context, 0.05),
          child: Image.asset(ImagePath.BLOB_FEMUR_ASH),
        ),
        Positioned(
          right: -assignWidth(context, 0.5),
          child: Image.asset(ImagePath.BLOB_SMALL_BEAN_ASH),
        ),
        Column(
          children: [
            SkillsSection(key: key),
            SizedBox(height: spacerHeight),
            StatisticsSection(),
            SizedBox(height: spacerHeight),
            ProjectsSection(key: keyTwo),
          ],
        ),
      ],
    );
  }
}
