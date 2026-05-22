import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/ozi/ozi_detail_page.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class OziSection extends StatefulWidget {
  const OziSection({Key? key}) : super(key: key);

  @override
  _OziSectionState createState() => _OziSectionState();
}

class _OziSectionState extends State<OziSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('ozi-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction * 100 > 15) _controller.forward();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            final isMobile = sizingInformation.screenSize.width <
                RefinedBreakpoints().tabletLarge;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, isMobile),
                SpaceH40(),
                _buildMetricsCard(context, isMobile),
                SizedBox(height: 32),
                _buildCTA(context),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    if (isMobile) {
      return NimbusInfoSection2(
        sectionTitle: StringConst.OZI_SECTION_LABEL,
        title1: StringConst.OZI_SECTION_TITLE,
        hasTitle2: false,
        body: StringConst.OZI_SECTION_BODY,
      );
    }
    return SizedBox(
      width: widthOfScreen(context) * 0.6,
      child: NimbusInfoSection1(
        sectionTitle: StringConst.OZI_SECTION_LABEL,
        title1: StringConst.OZI_SECTION_TITLE,
        hasTitle2: false,
        body: StringConst.OZI_SECTION_BODY,
      ),
    );
  }

  Widget _buildMetricsCard(BuildContext context, bool isMobile) {
    final metrics = [
      _Metric(StringConst.OZI_METRIC_DAU_VAL, StringConst.OZI_METRIC_DAU),
      _Metric(StringConst.OZI_METRIC_MAU_VAL, StringConst.OZI_METRIC_MAU),
      _Metric(StringConst.OZI_METRIC_COLD_START_VAL,
          StringConst.OZI_METRIC_COLD_START),
      _Metric(StringConst.OZI_METRIC_ORDERS_VAL, StringConst.OZI_METRIC_ORDERS),
    ];

    return Card(
      elevation: Sizes.ELEVATION_4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_10)),
      ),
      color: AppColors.black400,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizes.PADDING_40,
          horizontal: 24,
        ),
        child: isMobile
            ? Column(
                children: metrics
                    .map((m) => Padding(
                          padding: EdgeInsets.only(bottom: 28),
                          child: _buildMetricItem(m),
                        ))
                    .toList(),
              )
            : Row(
                children: [
                  for (int i = 0; i < metrics.length; i++) ...[
                    if (i > 0)
                      Container(
                        height: 48,
                        width: 1,
                        color: AppColors.grey350,
                      ),
                    Expanded(child: _buildMetricItem(metrics[i])),
                  ],
                ],
              ),
      ),
    );
  }

  Widget _buildMetricItem(_Metric m) {
    final textTheme = Theme.of(context).textTheme;
    return FadeTransition(
      opacity: _controller,
      child: Column(
        children: [
          Text(
            m.value,
            style: textTheme.displaySmall?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            m.label,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.grey150,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCTA(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const OziDetailPage()),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        StringConst.OZI_VIEW_CASE_STUDY,
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}

class _Metric {
  final String value;
  final String label;
  const _Metric(this.value, this.label);
}
