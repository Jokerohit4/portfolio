import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/bullet_text.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Technical highlights. Text only — the decorative award illustration and its
/// rotating globe were removed, so this no longer needs animation state.
class AwardsSection extends StatelessWidget {
  const AwardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          final double screenWidth = sizingInformation.screenSize.width;
          final bool isNarrow = screenWidth < RefinedBreakpoints().tabletSmall;

          return isNarrow
              ? _buildSm(context)
              : _buildLg(context, stacked: screenWidth <= 1024);
        },
      ),
    );
  }

  Widget _buildSm(BuildContext context) {
    return NimbusInfoSection2(
      sectionTitle: StringConst.MY_AWARDS,
      title1: StringConst.AWARDS_TITLE,
      hasTitle2: false,
      body: StringConst.AWARDS_DESC,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _awardsColumn(context, StringConst.AWARDS_TYPE_TITLE_1, Data.awards1),
          SpaceH40(),
          _awardsColumn(context, StringConst.AWARDS_TYPE_TITLE_2, Data.awards2),
        ],
      ),
    );
  }

  Widget _buildLg(BuildContext context, {required bool stacked}) {
    return NimbusInfoSection1(
      sectionTitle: StringConst.MY_AWARDS,
      title1: StringConst.AWARDS_TITLE,
      hasTitle2: false,
      body: StringConst.AWARDS_DESC,
      child: stacked
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _awardsColumn(
                    context, StringConst.AWARDS_TYPE_TITLE_1, Data.awards1),
                SpaceH40(),
                _awardsColumn(
                    context, StringConst.AWARDS_TYPE_TITLE_2, Data.awards2),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _awardsColumn(
                      context, StringConst.AWARDS_TYPE_TITLE_1, Data.awards1),
                ),
                SpaceW40(),
                Expanded(
                  child: _awardsColumn(
                      context, StringConst.AWARDS_TYPE_TITLE_2, Data.awards2),
                ),
              ],
            ),
    );
  }

  Widget _awardsColumn(BuildContext context, String title, List<String> items) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.titleSmall),
        SpaceH16(),
        for (final item in items) ...[
          TextWithBullet(text: item),
          SpaceH16(),
        ],
      ],
    );
  }
}
