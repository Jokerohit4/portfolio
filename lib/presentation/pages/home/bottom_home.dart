import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/home/sections/footer_section.dart';
import 'package:nimbus/presentation/pages/home/sections/hobbies_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class BottomHomeBody extends StatelessWidget {
  const BottomHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -assignWidth(context, 0.6),
          child: Image.asset(ImagePath.BLOB_ASH),
        ),
        Column(
          children: [
            Container(
              key: key,
              child: HobbiesSection(),
            ),
            // Container(
            //   key: navItems[4].key,
            //   child: AwardsSection(),
            // ),
            SpaceH40(),
            // Container(
            //   key: navItems[5].key,
            //   child: BlogSection(),
            // ),
            ///TODO
            FooterSection(),
          ],
        )
      ],
    );
  }
}
