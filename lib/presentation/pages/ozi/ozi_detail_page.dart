import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/pages/ozi/ozi_charts.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OziDetailPage extends StatelessWidget {
  const OziDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          StringConst.OZI_DETAIL_TITLE,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: getSidePadding(context),
          vertical: 32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHero(context),
            const SizedBox(height: 48),
            _buildSectionHeader(context, StringConst.OZI_BIZ_SECTION,
                StringConst.OZI_BIZ_HEADING),
            const SizedBox(height: 24),
            _buildBusinessOutcomes(context),
            const SizedBox(height: 48),
            _buildSectionHeader(context, StringConst.OZI_METRICS_SECTION,
                StringConst.OZI_METRICS_TITLE),
            const SizedBox(height: 24),
            _buildMetricsCard(context),
            const SizedBox(height: 48),
            _buildSectionHeader(context, 'business impact', 'How the Metrics Moved'),
            const SizedBox(height: 24),
            const OziImpactCharts(),
            const SizedBox(height: 48),
            _buildSectionHeader(context, StringConst.OZI_FEATURES_SECTION,
                StringConst.OZI_FEATURES_TITLE),
            const SizedBox(height: 24),
            _buildFeaturesSection(context),
            const SizedBox(height: 48),
            _buildSectionHeader(context, StringConst.OZI_ARCH_SECTION,
                StringConst.OZI_ARCH_TITLE),
            const SizedBox(height: 24),
            _buildArchSection(context),
            const SizedBox(height: 40),
            _buildFootnote(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ── Hero ──────────────────────────────────────────────────────────────────

  Widget _buildHero(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringConst.OZI_DETAIL_SUBTITLE,
          style: textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: responsiveSize(context, 22, 34, md: 28),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _chip(context, StringConst.OZI_DETAIL_ROLE, AppColors.primaryColor,
                primary: true),
            _chip(context, StringConst.OZI_DETAIL_PERIOD, AppColors.grey350),
            _chip(context, StringConst.OZI_DETAIL_TEAM_SIZE, AppColors.grey350),
            _chip(context, StringConst.OZI_DETAIL_PLATFORM, AppColors.grey350),
          ],
        ),
      ],
    );
  }

  Widget _chip(BuildContext context, String label, Color color,
      {bool primary = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        border: Border.all(color: color.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: primary ? AppColors.primaryColor : null,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  // ── Section header (rotated-label style) ─────────────────────────────────

  Widget _buildSectionHeader(BuildContext context, String label, String title) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: Sizes.HEIGHT_64,
              child: Divider(color: AppColors.grey350, thickness: 1.15),
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: textTheme.bodyMedium?.copyWith(color: AppColors.grey250),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: textTheme.displaySmall?.copyWith(
            fontSize: responsiveSize(context, 24, 34, md: 28),
          ),
        ),
      ],
    );
  }

  // ── Business outcomes (plain-language for non-technical readers) ─────────

  Widget _buildBusinessOutcomes(BuildContext context) {
    final outcomes = [
      _BizOutcome(Icons.trending_up_rounded, StringConst.OZI_BIZ_1_HEADLINE,
          StringConst.OZI_BIZ_1_BODY),
      _BizOutcome(Icons.shopping_bag_outlined, StringConst.OZI_BIZ_2_HEADLINE,
          StringConst.OZI_BIZ_2_BODY),
      _BizOutcome(Icons.star_rounded, StringConst.OZI_BIZ_3_HEADLINE,
          StringConst.OZI_BIZ_3_BODY),
      _BizOutcome(Icons.rocket_launch_outlined, StringConst.OZI_BIZ_4_HEADLINE,
          StringConst.OZI_BIZ_4_BODY),
    ];

    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, si) {
        final isMobile = si.screenSize.width < RefinedBreakpoints().tabletLarge;
        if (isMobile) {
          return Column(
            children: outcomes
                .map((o) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _outcomeCard(context, o),
                    ))
                .toList(),
          );
        }
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _outcomeCard(context, outcomes[0])),
                const SizedBox(width: 12),
                Expanded(child: _outcomeCard(context, outcomes[1])),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _outcomeCard(context, outcomes[2])),
                const SizedBox(width: 12),
                Expanded(child: _outcomeCard(context, outcomes[3])),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _outcomeCard(BuildContext context, _BizOutcome o) {
    final tt = Theme.of(context).textTheme;
    // Card handles dark/light surface colour automatically.
    // ClipBehavior ensures the gold left bar is clipped to rounded corners.
    // Using IntrinsicHeight so the left bar always matches card height.
    return Card(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gold left accent bar
            Container(width: 4, color: AppColors.primaryColor),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(o.icon, color: AppColors.primaryColor, size: 20),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            o.headline,
                            style: tt.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700, height: 1.3),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            o.body,
                            style: tt.bodySmall?.copyWith(
                                color: AppColors.grey250,
                                height: 1.6,
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Metrics card (Firebase-verified numbers) ──────────────────────────────

  Widget _buildMetricsCard(BuildContext context) {
    final detailMetrics = [
      _DetailMetric(StringConst.OZI_METRIC_DAU_VAL, StringConst.OZI_METRIC_DAU,
          "Typical weekday · April 2026"),
      _DetailMetric(StringConst.OZI_METRIC_MAU_VAL, StringConst.OZI_METRIC_MAU,
          "173K unique users · April 2026"),
      _DetailMetric(
          StringConst.OZI_METRIC_COLD_START_VAL,
          StringConst.OZI_METRIC_COLD_START,
          "620ms → 295ms · Firebase Performance"),
      _DetailMetric(StringConst.OZI_METRIC_ORDERS_VAL,
          StringConst.OZI_METRIC_ORDERS, "25,700 confirmed orders · 6 weeks"),
    ];

    return Card(
      elevation: Sizes.ELEVATION_4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_10)),
      ),
      color: AppColors.black400,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            final isMobile = sizingInformation.screenSize.width <
                RefinedBreakpoints().tabletLarge;
            if (isMobile) {
              return Column(
                children: detailMetrics
                    .map((m) => Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: _buildDetailMetricItem(context, m),
                        ))
                    .toList(),
              );
            }
            return Row(
              children: [
                for (int i = 0; i < detailMetrics.length; i++) ...[
                  if (i > 0)
                    Container(height: 60, width: 1, color: AppColors.grey350),
                  Expanded(
                      child: _buildDetailMetricItem(context, detailMetrics[i])),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailMetricItem(BuildContext context, _DetailMetric m) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          m.value,
          style: textTheme.displayMedium?.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          m.label,
          style: textTheme.titleSmall?.copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          m.note,
          style: textTheme.bodySmall?.copyWith(color: AppColors.grey150),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // ── Features table / cards ────────────────────────────────────────────────

  Widget _buildFeaturesSection(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.screenSize.width <
            RefinedBreakpoints().tabletLarge;
        if (isMobile) {
          return Column(
            children: Data.oziFeatures
                .map((f) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildFeatureCardMobile(context, f),
                    ))
                .toList(),
          );
        }
        return _buildFeaturesTable(context);
      },
    );
  }

  Widget _buildFeatureCardMobile(BuildContext context, OziFeatureData f) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.grey350.withValues(alpha: 0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(f.feature,
                style: textTheme.titleSmall
                    ?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                _featureChip(
                    context, '⏱ ${f.timeToDeliver}', AppColors.primaryColor),
                _featureChip(
                    context, '✓ ${f.quality}', const Color(0xFF4CAF50)),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              f.impact,
              style: textTheme.bodyMedium
                  ?.copyWith(color: AppColors.grey250, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesTable(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final headerStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.grey250,
      fontWeight: FontWeight.w600,
      fontSize: 13,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Table(
        border: TableBorder.all(
          color: AppColors.grey350.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        columnWidths: const {
          0: FlexColumnWidth(2.2),
          1: FlexColumnWidth(1.4),
          2: FlexColumnWidth(2.2),
          3: FlexColumnWidth(2.5),
        },
        children: [
          TableRow(
            decoration:
                BoxDecoration(color: AppColors.black400.withValues(alpha: 0.7)),
            children: [
              _tableCell(context, StringConst.OZI_COL_FEATURE,
                  style: headerStyle),
              _tableCell(context, StringConst.OZI_COL_TIME, style: headerStyle),
              _tableCell(context, StringConst.OZI_COL_QUALITY,
                  style: headerStyle),
              _tableCell(context, StringConst.OZI_COL_IMPACT,
                  style: headerStyle),
            ],
          ),
          ...Data.oziFeatures.asMap().entries.map((entry) {
            final i = entry.key;
            final f = entry.value;
            final rowBg = i.isOdd
                ? AppColors.black400.withValues(alpha: 0.05)
                : Colors.transparent;
            return TableRow(
              decoration: BoxDecoration(color: rowBg),
              children: [
                _tableCell(context, f.feature,
                    style: textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
                _tableCell(context, f.timeToDeliver),
                _tableCell(context, f.quality),
                _tableCell(context, f.impact),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _tableCell(BuildContext context, String text, {TextStyle? style}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Text(
        text,
        style: style ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.5),
      ),
    );
  }

  Widget _featureChip(BuildContext context, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: color, fontSize: 11),
      ),
    );
  }

  // ── Architecture wins ─────────────────────────────────────────────────────

  Widget _buildArchSection(BuildContext context) {
    final wins = [
      _ArchWin(
        'HomeBloc Decomposition',
        '2,000-line monolith → 5 focused blocs. 81% code reduction, 77% fewer events. Each bloc independently testable.',
        Icons.architecture_outlined,
      ),
      _ArchWin(
        'Networking Layer Restructure',
        '1,430-line ApiClient → 11 modular layers. 179 files updated. Added request deduplication, retry backoff, and token auto-refresh.',
        Icons.cloud_outlined,
      ),
      _ArchWin(
        'Launch Performance',
        'Pre-warmed Flutter engine: 620ms → 295ms (Firebase verified). Event-driven deeplinks removed 2s polling delay. AppFlyer early start −50-400ms.',
        Icons.bolt_outlined,
      ),
    ];

    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        final isMobile = sizingInformation.screenSize.width <
            RefinedBreakpoints().tabletLarge;
        if (isMobile) {
          return Column(
            children: wins
                .map((w) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildWinCard(context, w),
                    ))
                .toList(),
          );
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: wins
              .map((w) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: _buildWinCard(context, w),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _buildWinCard(BuildContext context, _ArchWin win) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: AppColors.primaryColor.withValues(alpha: 0.25)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(win.icon, color: AppColors.primaryColor, size: 28),
            const SizedBox(height: 12),
            Text(
              win.title,
              style:
                  textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              win.description,
              style: textTheme.bodyMedium
                  ?.copyWith(color: AppColors.grey250, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }

  // ── Footnote ──────────────────────────────────────────────────────────────

  Widget _buildFootnote(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border:
            Border(left: BorderSide(color: AppColors.primaryColor, width: 3)),
      ),
      child: Text(
        'All metrics sourced from Firebase BigQuery (analyticsdata, firebase_crashlytics, firebase_performance). '
        'DAU and MAU figures are from April 2026. Cold start measurement covers 34,000+ sessions. '
        'Crash data reflects production Android builds.',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.grey250,
              height: 1.6,
            ),
      ),
    );
  }
}

// ── Private data classes ──────────────────────────────────────────────────────

class _BizOutcome {
  final IconData icon;
  final String headline;
  final String body;
  const _BizOutcome(this.icon, this.headline, this.body);
}

class _DetailMetric {
  final String value;
  final String label;
  final String note;
  const _DetailMetric(this.value, this.label, this.note);
}

class _ArchWin {
  final String title;
  final String description;
  final IconData icon;
  const _ArchWin(this.title, this.description, this.icon);
}
