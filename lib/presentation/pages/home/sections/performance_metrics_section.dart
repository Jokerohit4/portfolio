import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PerformanceMetricsSection extends StatelessWidget {
  const PerformanceMetricsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentArea(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        children: [
          _buildHeader(context),
          _buildMetricsGrid(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < RefinedBreakpoints().tabletLarge;

    if (isMobile) {
      return NimbusInfoSection2(
        sectionTitle: StringConst.PERFORMANCE,
        title1: StringConst.PERFORMANCE_TITLE,
        hasTitle2: false,
        body: StringConst.PERFORMANCE_DESC,
      );
    }

    return SizedBox(
      width: widthOfScreen(context) * 0.6,
      child: NimbusInfoSection1(
        sectionTitle: StringConst.PERFORMANCE,
        title1: StringConst.PERFORMANCE_TITLE,
        hasTitle2: false,
        body: StringConst.PERFORMANCE_DESC,
      ),
    );
  }

  Widget _buildMetricsGrid(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        final screenWidth = sizingInformation.screenSize.width;
        final isMobile = screenWidth < RefinedBreakpoints().tabletLarge;
        final crossAxisCount = isMobile ? 1 : 2;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          childAspectRatio: isMobile ? 1.10 : 2.9,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildMetricCard(
              context,
              StringConst.PERFORMANCE_STARTUP,
              StringConst.PERFORMANCE_STARTUP_BEFORE,
              StringConst.PERFORMANCE_STARTUP_AFTER,
              StringConst.PERFORMANCE_STARTUP_IMPROVEMENT,
              Icons.rocket_launch,
            ),
            _buildMetricCard(
              context,
              StringConst.PERFORMANCE_CRASHES,
              '85%',
              StringConst.PERFORMANCE_CRASHES_VAL,
              StringConst.PERFORMANCE_CRASHES_CONTEXT,
              Icons.verified_user,
            ),
            _buildMetricCard(
              context,
              StringConst.PERFORMANCE_GROWTH,
              'Q1',
              StringConst.PERFORMANCE_GROWTH_VAL,
              StringConst.PERFORMANCE_GROWTH_CONTEXT,
              Icons.trending_up,
            ),
            _buildMetricCard(
              context,
              StringConst.PERFORMANCE_RATING,
              StringConst.PERFORMANCE_RATING_BEFORE,
              StringConst.PERFORMANCE_RATING_AFTER,
              StringConst.PERFORMANCE_RATING_IMPROVEMENT,
              Icons.star,
            ),
          ],
        );
      },
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String before,
    String after,
    String contextLabel,
    IconData icon,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: Sizes.ELEVATION_2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
      ),
      color: AppColors.black400,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  icon,
                  color: AppColors.primaryColor,
                  size: 24,
                ),
              ],
            ),
            SpaceH8(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Before',
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.grey350,
                        ),
                      ),
                      Text(
                        before,
                        style: textTheme.titleMedium?.copyWith(
                          color: AppColors.grey150,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.primaryColor,
                  size: 18,
                ),
                SpaceW8(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'After',
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.grey350,
                        ),
                      ),
                      Text(
                        after,
                        style: textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SpaceH8(),
            Text(
              contextLabel,
              style: textTheme.labelSmall?.copyWith(
                color: AppColors.grey350,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
