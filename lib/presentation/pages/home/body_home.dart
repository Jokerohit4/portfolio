import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/bottom_home.dart';
import 'package:nimbus/presentation/pages/home/sections/skills_section.dart';
import 'package:nimbus/presentation/pages/home/sections/statistics_section.dart';
import 'package:nimbus/presentation/widgets/nav_item.dart';
import 'package:nimbus/values/values.dart';

class BodyHome extends StatelessWidget {
  const BodyHome(
      {super.key,
      required this.scrollController,
      required this.navItems,
      required this.controller});
  final ScrollController scrollController;
  final List<NavItemData> navItems;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    double screenHeight = heightOfScreen(context);
    double spacerHeight = screenHeight * 0.10;
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                        Theme.of(context).brightness.name.contains("dark")
                            ? ImagePath.BLOB_BLACK
                            : ImagePath.BLOB_BEAN_ASH),
                  ),
                ),
                // AboutMe(
                //     spacerHeight: spacerHeight,
                //     navItems: navItems,
                //     controller: controller),
              ],
            ),
            SizedBox(height: spacerHeight),
            Stack(
              children: [
                Positioned(
                  top: assignWidth(context, 0.1),
                  left: -assignWidth(context, 0.05),
                  child: Image.asset(
                      Theme.of(context).brightness.name.contains("dark")
                          ? ImagePath.BLOB_BLACK
                          : ImagePath.BLOB_FEMUR_ASH),
                ),
                Positioned(
                  right: -assignWidth(context, 0.5),
                  child: Image.asset(ImagePath.BLOB_SMALL_BEAN_ASH),
                ),
                Column(
                  children: [
                    SkillsSection(key: navItems[2].key),
                    SizedBox(height: spacerHeight),
                    StatisticsSection(),
                    SizedBox(height: spacerHeight),
                    //ProjectsSection(key: navItems[3].key),
                  ],
                ),
              ],
            ),
            // SkillsAndProjects(
            //   key: navItems[3].key,
            //   spacerHeight: spacerHeight,
            //   keyTwo: navItems[4].key,
            // ),
            SizedBox(height: spacerHeight),
            BottomHomeBody(key: navItems[4].key)
          ],
        ),
      ),
    );
  }
}
