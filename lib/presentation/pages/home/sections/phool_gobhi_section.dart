import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/routes/router.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Home-page feature block for Phool Gobhi.
///
/// Deliberately the loudest thing on the page after the header: it is the
/// current work, and it is what an investor came to read about.
class PhoolGobhiSection extends StatelessWidget {
  const PhoolGobhiSection({Key? key}) : super(key: key);

  static const List<String> _pieces = [
    "Customer app",
    "Partner app",
    "Website",
    "Partner dashboard",
    "Admin portal",
    "6 backend services",
    "Payments",
    "Analytics",
  ];

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizing) {
          final isMobile =
              sizing.screenSize.width < RefinedBreakpoints().tabletNormal;

          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 24 : 44),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.08),
              border: Border.all(
                color: AppColors.primaryColor.withValues(alpha: 0.45),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CURRENTLY BUILDING",
                  style: t.labelSmall?.copyWith(
                    color: AppColors.primaryColor,
                    letterSpacing: 2.4,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SpaceH16(),
                Text(
                  "Phool Gobhi",
                  style: (isMobile ? t.titleLarge : t.displaySmall)?.copyWith(
                    color: AppColors.primaryColor,
                    height: 1.1,
                  ),
                ),
                SpaceH8(),
                Text(
                  "A fitness ecosystem — apps, backend and web, built end to end.",
                  style: t.titleMedium?.copyWith(height: 1.35),
                ),
                SpaceH20(),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 760),
                  child: Text(
                    "Pay-per-session gym access with no membership. Two Flutter "
                    "apps, six Node services behind an API gateway on Cloud Run, "
                    "three Next.js frontends, wallet payments, signed QR check-in "
                    "and a first-party analytics pipeline. Designed, built and "
                    "operated solo.",
                    style: t.bodyLarge?.copyWith(height: 1.75),
                  ),
                ),
                SpaceH24(),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _pieces
                      .map(
                        (p) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  AppColors.primaryColor.withValues(alpha: 0.4),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            p,
                            style: t.labelSmall?.copyWith(letterSpacing: 0.6),
                          ),
                        ),
                      )
                      .toList(),
                ),
                SpaceH30(),
                InkWell(
                  onTap: () => AutoRouter.of(context).push(
                    const PhoolGobhiRoute(),
                  ),
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Read the full case study",
                          style: t.bodyMedium?.copyWith(
                            color: AppColors.black400,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SpaceW8(),
                        Icon(Icons.arrow_forward,
                            size: 16, color: AppColors.black400),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
