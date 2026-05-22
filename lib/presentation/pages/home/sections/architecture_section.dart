import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentArea(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        children: [
          _buildHeader(context),
          SpaceH40(),
          _buildArchitectureCards(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < RefinedBreakpoints().tabletLarge;

    if (isMobile) {
      return NimbusInfoSection2(
        sectionTitle: StringConst.ARCHITECTURE,
        title1: StringConst.ARCHITECTURE_TITLE,
        hasTitle2: false,
        body: StringConst.ARCHITECTURE_DESC,
      );
    }

    return SizedBox(
      width: widthOfScreen(context) * 0.6,
      child: NimbusInfoSection1(
        sectionTitle: StringConst.ARCHITECTURE,
        title1: StringConst.ARCHITECTURE_TITLE,
        hasTitle2: false,
        body: StringConst.ARCHITECTURE_DESC,
      ),
    );
  }

  Widget _buildArchitectureCards(BuildContext context) {
    return Column(
      children: Data.architectureShowcases
          .asMap()
          .entries
          .map((entry) {
            final index = entry.key;
            final architecture = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                bottom: index < Data.architectureShowcases.length - 1 ? 32 : 0,
              ),
              child: _buildArchitectureCard(context, architecture),
            );
          })
          .toList(),
    );
  }

  Widget _buildArchitectureCard(
      BuildContext context, ArchitectureData architecture) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: Sizes.ELEVATION_2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
      ),
      color: AppColors.black400,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              architecture.projectTitle,
              style: textTheme.titleLarge?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SpaceH12(),
            Text(
              architecture.description,
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.grey250,
                height: 1.6,
              ),
            ),
            SpaceH24(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: architecture.keyPoints
                  .asMap()
                  .entries
                  .map((entry) {
                    final point = entry.value;
                    final isEmptyLine = point.isEmpty;
                    final isDiagramLine = point.startsWith('  ') || point.contains('→');

                    if (isEmptyLine) {
                      return SizedBox(height: 8);
                    }

                    if (isDiagramLine) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.black200,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: AppColors.primaryColor.withOpacity(0.2),
                            ),
                          ),
                          child: Text(
                            point,
                            style: TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 12,
                              color: AppColors.primaryColor,
                              height: 1.4,
                            ),
                          ),
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                '✓',
                                style: textTheme.labelSmall?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SpaceW16(),
                          Expanded(
                            child: Text(
                              point,
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
