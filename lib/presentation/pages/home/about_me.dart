import 'package:flutter/material.dart';
import 'package:nimbus/presentation/pages/home/sections/about_me_section.dart';
import 'package:nimbus/presentation/pages/home/sections/header_section/header_section.dart';
import 'package:nimbus/presentation/widgets/nav_item.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMe extends StatelessWidget {
  const AboutMe(
      {super.key,
      required this.spacerHeight,
      required this.navItems,
      required this.controller});
  final double spacerHeight;
  final List<NavItemData> navItems;
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderSection(
          key: navItems[0].key,
        ),
        SizedBox(height: spacerHeight),
        VisibilityDetector(
          key: Key("about"),
          onVisibilityChanged: (visibilityInfo) {
            double visiblePercentage = visibilityInfo.visibleFraction * 100;
            if (visiblePercentage > 10) {
              controller.forward();
            }
          },
          child: AboutMeSection(key: navItems[1].key),
        ),
      ],
    );
  }
}
