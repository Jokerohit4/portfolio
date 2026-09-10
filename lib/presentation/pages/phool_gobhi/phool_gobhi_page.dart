import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/routes/router.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

/// Full case study for Phool Gobhi.
///
/// This page has two audiences at once: people deciding whether to hire me,
/// and people deciding whether to back the product. It leads with what is
/// actually built rather than with projections, and it does not claim usage
/// numbers, because the product is pre-launch.
@RoutePage()
class PhoolGobhiPage extends StatelessWidget {
  const PhoolGobhiPage({Key? key}) : super(key: key);

  static const double _maxContent = 1080;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.black400 : AppColors.white,
      body: SingleChildScrollView(
        child: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizing) {
            final isMobile =
                sizing.screenSize.width < RefinedBreakpoints().tabletNormal;
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getSidePadding(context),
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: _maxContent),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpaceH40(),
                      _BackLink(),
                      SpaceH40(),
                      _Hero(isMobile: isMobile),
                      SpaceH60(),
                      _BuildStats(isMobile: isMobile),
                      SpaceH80(),
                      _SectionHeading(
                        label: "the product",
                        title: "Four surfaces, one platform",
                        body:
                            "A marketplace needs both sides served and someone "
                            "watching the middle. That is four applications, "
                            "each with a different job.",
                      ),
                      SpaceH40(),
                      ...PhoolGobhiData.surfaces.map(
                        (s) => _SurfaceCard(surface: s, isMobile: isMobile),
                      ),
                      SpaceH60(),
                      _SectionHeading(
                        label: "the backend",
                        title: "Six services behind one gateway",
                        body:
                            "Every client talks to a single gateway. Nothing "
                            "reaches a service directly, and no service trusts "
                            "a header it did not verify.",
                      ),
                      SpaceH40(),
                      _ServiceTable(isMobile: isMobile),
                      SpaceH30(),
                      _InfraNote(),
                      SpaceH80(),
                      _SectionHeading(
                        label: "engineering",
                        title: "Decisions worth explaining",
                        body:
                            "The interesting parts of a build are the places "
                            "where the obvious approach is wrong.",
                      ),
                      SpaceH40(),
                      ...PhoolGobhiData.decisions.map(
                        (d) => _DecisionBlock(decision: d, isMobile: isMobile),
                      ),
                      SpaceH60(),
                      _NextSection(isMobile: isMobile),
                      SpaceH60(),
                      _InvestorCta(isMobile: isMobile),
                      SpaceH80(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ── Back to portfolio ────────────────────────────────────────────────────
class _BackLink extends StatelessWidget {
  /// Most visitors arrive here from the home page, but an investor following a
  /// shared link lands here directly with nothing to pop — so fall back to
  /// navigating home rather than leaving a dead control on the page.
  Future<void> _back(BuildContext context) async {
    final router = AutoRouter.of(context);
    final popped = await router.maybePop();
    if (!popped) router.replaceAll([const HomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _back(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_back, size: 16, color: AppColors.primaryColor),
          SpaceW8(),
          Text(
            "Back to portfolio",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

// ── Hero ─────────────────────────────────────────────────────────────────
class _Hero extends StatelessWidget {
  const _Hero({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusPill(),
        SpaceH20(),
        Text(
          "Phool Gobhi",
          style: (isMobile ? t.displaySmall : t.displayMedium)?.copyWith(
            color: AppColors.primaryColor,
            height: 1.05,
          ),
        ),
        SpaceH8(),
        Text(
          PhoolGobhiData.tagline,
          style: t.titleMedium?.copyWith(letterSpacing: 1.2),
        ),
        SpaceH30(),
        Text(PhoolGobhiData.intro, style: t.bodyLarge?.copyWith(height: 1.75)),
        SpaceH20(),
        Text(PhoolGobhiData.scope, style: t.bodyLarge?.copyWith(height: 1.75)),
        SpaceH30(),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            _ActionButton(
              label: "Visit phoolgobhi.com",
              filled: true,
              onTap: () => openUrlLink(StringConst.PHOOL_GOBHI_LINK, context),
            ),
            _ActionButton(
              label: "Investor enquiries",
              filled: false,
              onTap: () => openUrlLink(StringConst.INVESTOR_EMAIL_URL, context),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.12),
        border: Border.all(color: AppColors.primaryColor.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        "PRE-LAUNCH · CLOSED TESTING",
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.primaryColor,
              letterSpacing: 1.4,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

// ── Build stats ──────────────────────────────────────────────────────────
class _BuildStats extends StatelessWidget {
  const _BuildStats({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      children: PhoolGobhiData.buildStats.map((s) {
        return Container(
          width: isMobile ? 150 : 190,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryColor.withValues(alpha: 0.35),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.value,
                style: t.displaySmall?.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: isMobile ? 30 : 38,
                  height: 1.1,
                ),
              ),
              SpaceH4(),
              Text(
                s.label.toUpperCase(),
                style: t.labelSmall?.copyWith(letterSpacing: 1.1),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

// ── Section heading ──────────────────────────────────────────────────────
class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.label,
    required this.title,
    required this.body,
  });

  final String label;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: t.labelSmall?.copyWith(
            color: AppColors.primaryColor,
            letterSpacing: 2.2,
            fontWeight: FontWeight.w700,
          ),
        ),
        SpaceH12(),
        Text(title, style: t.titleLarge?.copyWith(height: 1.2)),
        SpaceH16(),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Text(body, style: t.bodyLarge?.copyWith(height: 1.7)),
        ),
      ],
    );
  }
}

// ── Surface card ─────────────────────────────────────────────────────────
class _SurfaceCard extends StatelessWidget {
  const _SurfaceCard({required this.surface, required this.isMobile});
  final PgSurface surface;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(isMobile ? 20 : 28),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey150.withValues(alpha: 0.45)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(surface.icon, color: AppColors.primaryColor, size: 22),
              SpaceW12(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(surface.title, style: t.titleMedium),
                    SpaceH4(),
                    Text(
                      surface.platform,
                      style: t.labelSmall?.copyWith(letterSpacing: 1.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SpaceH16(),
          Text(surface.summary, style: t.bodyLarge?.copyWith(height: 1.6)),
          SpaceH16(),
          ...surface.points.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 10),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      p,
                      style: t.bodyMedium?.copyWith(height: 1.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Service table ────────────────────────────────────────────────────────
class _ServiceTable extends StatelessWidget {
  const _ServiceTable({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Column(
      children: PhoolGobhiData.services.map((s) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.primaryColor, width: 2),
              top: BorderSide(
                  color: AppColors.grey150.withValues(alpha: 0.35)),
              right: BorderSide(
                  color: AppColors.grey150.withValues(alpha: 0.35)),
              bottom: BorderSide(
                  color: AppColors.grey150.withValues(alpha: 0.35)),
            ),
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _serviceName(t, s),
                    SpaceH8(),
                    Text(s.responsibility,
                        style: t.bodyMedium?.copyWith(height: 1.6)),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 190, child: _serviceName(t, s)),
                    SpaceW20(),
                    Expanded(
                      child: Text(s.responsibility,
                          style: t.bodyMedium?.copyWith(height: 1.6)),
                    ),
                  ],
                ),
        );
      }).toList(),
    );
  }

  Widget _serviceName(TextTheme t, PgService s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.name,
          style: t.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        Text(":${s.port}", style: t.labelSmall),
      ],
    );
  }
}

class _InfraNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        PhoolGobhiData.infra,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(height: 1.75),
      ),
    );
  }
}

// ── Engineering decision ─────────────────────────────────────────────────
class _DecisionBlock extends StatelessWidget {
  const _DecisionBlock({required this.decision, required this.isMobile});
  final PgDecision decision;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(decision.title, style: t.titleMedium?.copyWith(height: 1.3)),
          SpaceH12(),
          _labelled(t, "The problem", decision.problem),
          SpaceH12(),
          _labelled(t, "What I did", decision.solution),
        ],
      ),
    );
  }

  Widget _labelled(TextTheme t, String label, String body) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: t.labelSmall?.copyWith(
            color: AppColors.primaryColor,
            letterSpacing: 1.6,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        Text(body, style: t.bodyMedium?.copyWith(height: 1.7)),
      ],
    );
  }
}

// ── What's next ──────────────────────────────────────────────────────────
class _NextSection extends StatelessWidget {
  const _NextSection({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(isMobile ? 22 : 32),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.4),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ROADMAP",
            style: t.labelSmall?.copyWith(
              color: AppColors.primaryColor,
              letterSpacing: 2.2,
              fontWeight: FontWeight.w700,
            ),
          ),
          SpaceH12(),
          Text(PhoolGobhiData.nextTitle, style: t.titleLarge?.copyWith(height: 1.2)),
          SpaceH16(),
          Text(
            PhoolGobhiData.nextBody,
            style: t.bodyLarge?.copyWith(height: 1.75),
          ),
        ],
      ),
    );
  }
}

// ── Investor CTA ─────────────────────────────────────────────────────────
class _InvestorCta extends StatelessWidget {
  const _InvestorCta({required this.isMobile});
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 24 : 36),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Backing the build", style: t.titleLarge?.copyWith(height: 1.2)),
          SpaceH16(),
          Text(
            PhoolGobhiData.investorNote,
            style: t.bodyLarge?.copyWith(height: 1.75),
          ),
          SpaceH20(),
          Text(
            PhoolGobhiData.status,
            style: t.bodyMedium?.copyWith(
              height: 1.6,
              fontStyle: FontStyle.italic,
            ),
          ),
          SpaceH30(),
          Wrap(
            spacing: 14,
            runSpacing: 12,
            children: [
              _ActionButton(
                label: "Investor enquiries",
                filled: true,
                onTap: () =>
                    openUrlLink(StringConst.INVESTOR_EMAIL_URL, context),
              ),
              _ActionButton(
                label: "Hiring enquiries",
                filled: false,
                onTap: () => openUrlLink(StringConst.EMAIL_URL, context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Shared button ────────────────────────────────────────────────────────
class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
        decoration: BoxDecoration(
          color: filled ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: filled ? AppColors.black400 : AppColors.primaryColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
