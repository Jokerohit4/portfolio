import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentArea(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        children: [
          _buildHeader(context),
          SpaceH40(),
          _buildTestimonialCards(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < RefinedBreakpoints().tabletLarge;

    if (isMobile) {
      return NimbusInfoSection2(
        sectionTitle: StringConst.TESTIMONIALS,
        title1: StringConst.TESTIMONIALS_TITLE,
        hasTitle2: false,
        body: StringConst.TESTIMONIALS_DESC,
      );
    }

    return SizedBox(
      width: widthOfScreen(context) * 0.6,
      child: NimbusInfoSection1(
        sectionTitle: StringConst.TESTIMONIALS,
        title1: StringConst.TESTIMONIALS_TITLE,
        hasTitle2: false,
        body: StringConst.TESTIMONIALS_DESC,
      ),
    );
  }

  Widget _buildTestimonialCards(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        final screenWidth = sizingInformation.screenSize.width;
        final isMobile = screenWidth < RefinedBreakpoints().tabletLarge;

        if (isMobile) {
          return Column(
            children: Data.testimonials
                .map((testimonial) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _buildTestimonialCard(context, testimonial),
                    ))
                .toList(),
          );
        }

        return Row(
          children: Data.testimonials
              .map((testimonial) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: _buildTestimonialCard(context, testimonial),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _buildTestimonialCard(BuildContext context, TestimonialData testimonial) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: Sizes.ELEVATION_2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
      ),
      color: AppColors.black400,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '"${testimonial.quote}"',
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.white,
                fontStyle: FontStyle.italic,
                height: 1.6,
              ),
            ),
            SpaceH24(),
            Container(
              height: 2,
              color: AppColors.primaryColor.withOpacity(0.3),
            ),
            SpaceH16(),
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Text(
                      testimonial.name[0].toUpperCase(),
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SpaceW16(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonial.name,
                        style: textTheme.labelLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${testimonial.role} @ ${testimonial.company}',
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.grey250,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
