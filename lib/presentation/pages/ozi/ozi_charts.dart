import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

// ── Firebase BigQuery data (all verified) ────────────────────────────────────

const _dauSpots = [
  FlSpot(6, 9378), FlSpot(7, 10266), FlSpot(8, 8686), FlSpot(9, 9590),
  FlSpot(10, 14210), FlSpot(11, 13673), FlSpot(12, 10438), FlSpot(13, 11046),
  FlSpot(14, 11558), FlSpot(15, 19607), FlSpot(16, 16228), FlSpot(17, 11389),
  FlSpot(18, 13143), FlSpot(19, 12876), FlSpot(20, 11078), FlSpot(21, 13040),
  FlSpot(22, 10614), FlSpot(23, 11191), FlSpot(24, 12635), FlSpot(25, 13643),
  FlSpot(26, 13912), FlSpot(27, 12873), FlSpot(28, 11481), FlSpot(29, 11095),
];

const _coldLabels = ['v1.0.23', 'v1.1', 'v1.2', 'v1.3', 'v1.4', 'v1.4.1', 'v1.5'];
const _coldMs = [936.0, 940.0, 736.0, 795.0, 648.0, 620.0, 295.0];

const _crashLabels = ['v1.6 (old)', 'v1.7', 'v1.8', 'v1.9', 'v1.10'];
const _crashCounts = [38028.0, 18.0, 93.0, 667.0, 1.0];

const _funnelStages = ['Sessions', 'Add to Cart', 'Orders', 'Purchased'];
const _funnelCounts = [188901, 26485, 13440, 10740];

// Orders: x=0→Apr6 … x=23→Apr29, x=24→May7 … x=30→May13
const _orderSpots = [
  FlSpot(0, 504),  FlSpot(1, 568),  FlSpot(2, 521),  FlSpot(3, 583),
  FlSpot(4, 592),  FlSpot(5, 732),  FlSpot(6, 819),  FlSpot(7, 484),
  FlSpot(8, 550),  FlSpot(9, 561),  FlSpot(10, 614), FlSpot(11, 575),
  FlSpot(12, 997), FlSpot(13, 852), FlSpot(14, 497), FlSpot(15, 595),
  FlSpot(16, 795), FlSpot(17, 975), FlSpot(18, 1082),FlSpot(19, 1468),
  FlSpot(20, 1375),FlSpot(21, 982), FlSpot(22, 1063),FlSpot(23, 866),
  FlSpot(24, 1137),FlSpot(25, 1009),FlSpot(26, 1100),FlSpot(27, 992),
  FlSpot(28, 902), FlSpot(29, 937), FlSpot(30, 987),
];

String _orderLabel(int x) {
  if (x <= 23) return 'Apr ${x + 6}';
  return 'May ${x - 24 + 7}';
}

// ANR by version — April 2026 (Crashlytics BQ)
const _anrLabels = ['v1.4', 'v1.4.1', 'v1.5', 'v1.6', 'v1.7', 'v1.8'];
const _anrCounts = [211.0, 228.0, 130.0, 92.0, 58.0, 2.0];

// ── Public section widget ─────────────────────────────────────────────────────

class OziImpactCharts extends StatelessWidget {
  const OziImpactCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, si) {
        final isMobile = si.screenSize.width < RefinedBreakpoints().tabletLarge;
        if (isMobile) {
          return Column(
            children: const [
              _DauChart(id: 'dau'),
              SizedBox(height: 16),
              _OrdersTrendChart(id: 'orders'),
              SizedBox(height: 16),
              _ColdStartChart(id: 'cold'),
              SizedBox(height: 16),
              _CrashChart(id: 'crash'),
              SizedBox(height: 16),
              _AnrChart(id: 'anr'),
              SizedBox(height: 16),
              _FunnelChart(id: 'funnel'),
            ],
          );
        }
        return Column(
          children: [
            const _DauChart(id: 'dau'),
            const SizedBox(height: 16),
            const _OrdersTrendChart(id: 'orders'),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: _ColdStartChart(id: 'cold')),
                SizedBox(width: 16),
                Expanded(child: _CrashChart(id: 'crash')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(child: _AnrChart(id: 'anr')),
                SizedBox(width: 16),
                Expanded(child: _FunnelChart(id: 'funnel')),
              ],
            ),
          ],
        );
      },
    );
  }
}

// ── Chart card shell ─────────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  final String title;
  final String source;
  final double chartHeight;
  final Widget chart;

  const _Card({
    required this.title,
    required this.source,
    required this.chart,
    this.chartHeight = 240,
  });

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    final tt = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: dark
            ? AppColors.black400.withValues(alpha: 0.6)
            : const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey350.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: tt.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 3),
          Text(source,
              style: tt.bodySmall
                  ?.copyWith(color: AppColors.grey250, fontSize: 10)),
          const SizedBox(height: 16),
          SizedBox(height: chartHeight, child: chart),
        ],
      ),
    );
  }
}

// ── Shared axis helpers ───────────────────────────────────────────────────────

FlGridData _hGrid() => FlGridData(
      show: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (_) =>
          FlLine(color: AppColors.grey350.withValues(alpha: 0.18), strokeWidth: 1),
    );

SideTitles _hidden() => const SideTitles(showTitles: false);

// ── DAU Trend Line Chart ──────────────────────────────────────────────────────

class _DauChart extends StatefulWidget {
  final String id;
  const _DauChart({required this.id});
  @override
  State<_DauChart> createState() => _DauChartState();
}

class _DauChartState extends State<_DauChart> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _ctrl =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1400));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (i) {
        if (!_done && i.visibleFraction > 0.15) {
          _done = true;
          _ctrl.forward();
        }
      },
      child: _Card(
        title: 'Daily Active Users — April 2026',
        source: 'Firebase BigQuery · analytics_498514583 · 24 days · peak 19,607',
        chartHeight: 220,
        chart: AnimatedBuilder(
          animation: _anim,
          builder: (_, __) {
            final n =
                (_dauSpots.length * _anim.value).ceil().clamp(1, _dauSpots.length);
            return LineChart(_dauData(_dauSpots.sublist(0, n)));
          },
        ),
      ),
    );
  }

  LineChartData _dauData(List<FlSpot> spots) {
    final gold = AppColors.primaryColor;
    return LineChartData(
      minX: 6, maxX: 29, minY: 0, maxY: 22000,
      clipData: const FlClipData.all(),
      gridData: _hGrid(),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: _hidden()),
        rightTitles: AxisTitles(sideTitles: _hidden()),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 5000,
            getTitlesWidget: (v, _) => Text(
              '${(v / 1000).toStringAsFixed(0)}K',
              style: TextStyle(fontSize: 10, color: AppColors.grey250),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 6,
            getTitlesWidget: (v, _) => Text(
              'Apr ${v.toInt()}',
              style: TextStyle(fontSize: 9, color: AppColors.grey250),
            ),
          ),
        ),
      ),
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => AppColors.black400,
          getTooltipItems: (list) => list.map((s) {
            final n = s.y.toInt().toString().replaceAllMapped(
                RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');
            return LineTooltipItem(
              'Apr ${s.x.toInt()}\n$n DAU',
              const TextStyle(
                  color: AppColors.white, fontSize: 12, height: 1.5),
            );
          }).toList(),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          curveSmoothness: 0.3,
          color: gold,
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
              radius: spot.y == 19607 ? 6 : 2.5,
              color: spot.y == 19607 ? AppColors.red : gold,
              strokeColor: Colors.transparent,
              strokeWidth: 0,
            ),
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                gold.withValues(alpha: 0.22),
                gold.withValues(alpha: 0.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── Cold Start Bar Chart ──────────────────────────────────────────────────────

class _ColdStartChart extends StatefulWidget {
  final String id;
  const _ColdStartChart({required this.id});
  @override
  State<_ColdStartChart> createState() => _ColdStartState();
}

class _ColdStartState extends State<_ColdStartChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (i) {
        if (!_done && i.visibleFraction > 0.2) {
          _done = true;
          _ctrl.forward();
        }
      },
      child: _Card(
        title: 'Cold Start Time by Version (ms)',
        source: 'Firebase Performance · 34K+ sessions · v1.5 = 295ms (52% faster)',
        chart: AnimatedBuilder(
          animation: _anim,
          builder: (_, __) => BarChart(_coldData()),
        ),
      ),
    );
  }

  BarChartData _coldData() {
    final gold = AppColors.primaryColor;
    return BarChartData(
      maxY: 1100,
      alignment: BarChartAlignment.spaceAround,
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => AppColors.black400,
          getTooltipItem: (g, _, rod, __) => BarTooltipItem(
            '${rod.toY.toInt()} ms',
            const TextStyle(color: AppColors.white, fontSize: 12),
          ),
        ),
      ),
      gridData: _hGrid(),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: _hidden()),
        rightTitles: AxisTitles(sideTitles: _hidden()),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 34,
            interval: 200,
            getTitlesWidget: (v, _) => Text(
              '${v.toInt()}',
              style: TextStyle(fontSize: 9, color: AppColors.grey250),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: (v, _) {
              final i = v.toInt();
              if (i < 0 || i >= _coldLabels.length) return const SizedBox.shrink();
              final isLast = i == _coldLabels.length - 1;
              return Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _coldLabels[i],
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: isLast ? FontWeight.bold : FontWeight.normal,
                    color: isLast ? gold : AppColors.grey250,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      barGroups: List.generate(_coldLabels.length, (i) {
        final isLast = i == _coldLabels.length - 1;
        return BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: _coldMs[i] * _anim.value,
              color: isLast
                  ? gold
                  : AppColors.grey350.withValues(alpha: 0.65),
              width: 20,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            ),
          ],
        );
      }),
    );
  }
}

// ── Crash Reduction Bar Chart ─────────────────────────────────────────────────

class _CrashChart extends StatefulWidget {
  final String id;
  const _CrashChart({required this.id});
  @override
  State<_CrashChart> createState() => _CrashState();
}

class _CrashState extends State<_CrashChart> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  static const _colors = [
    Color(0xFFEF5350), // v1.6 old broken — red
    Color(0xFF66BB6A), // v1.7 clean — green
    Color(0xFF66BB6A), // v1.8 clean — green
    Color(0xFFFFA726), // v1.9 spike — orange
    Color(0xFF66BB6A), // v1.10 clean — green
  ];

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (i) {
        if (!_done && i.visibleFraction > 0.2) {
          _done = true;
          _ctrl.forward();
        }
      },
      child: _Card(
        title: 'Fatal Crashes by Version — May 2026',
        source: 'Firebase Crashlytics BQ · v1.7+ nearly zero vs 38K in v1.6',
        chart: AnimatedBuilder(
          animation: _anim,
          builder: (_, __) => BarChart(_crashData()),
        ),
      ),
    );
  }

  BarChartData _crashData() {
    return BarChartData(
      maxY: 42000,
      alignment: BarChartAlignment.spaceAround,
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => AppColors.black400,
          getTooltipItem: (g, gi, rod, _) {
            final actual = _crashCounts[gi].toInt();
            final label = _crashLabels[gi];
            return BarTooltipItem(
              '$label\n$actual fatals',
              const TextStyle(
                  color: AppColors.white, fontSize: 12, height: 1.5),
            );
          },
        ),
      ),
      gridData: _hGrid(),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: _hidden()),
        rightTitles: AxisTitles(sideTitles: _hidden()),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            interval: 10000,
            getTitlesWidget: (v, _) => Text(
              '${(v / 1000).toStringAsFixed(0)}K',
              style: TextStyle(fontSize: 9, color: AppColors.grey250),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            getTitlesWidget: (v, _) {
              final i = v.toInt();
              if (i < 0 || i >= _crashLabels.length) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _crashLabels[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 9, color: AppColors.grey250),
                ),
              );
            },
          ),
        ),
      ),
      barGroups: List.generate(_crashCounts.length, (i) => BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: _crashCounts[i] * _anim.value,
            color: _colors[i],
            width: 26,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
      )),
    );
  }
}

// ── E-Commerce Funnel (custom animated bars) ──────────────────────────────────

class _FunnelChart extends StatefulWidget {
  final String id;
  const _FunnelChart({required this.id});
  @override
  State<_FunnelChart> createState() => _FunnelState();
}

class _FunnelState extends State<_FunnelChart> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final gold = AppColors.primaryColor;

    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (i) {
        if (!_done && i.visibleFraction > 0.15) {
          _done = true;
          _ctrl.forward();
        }
      },
      child: _Card(
        title: 'E-Commerce Conversion Funnel — Apr + May 2026',
        source:
            'Firebase Analytics BQ · 188K sessions → 14% cart → 7.1% orders → 5.7% purchase',
        chartHeight: 210,
        chart: AnimatedBuilder(
          animation: _anim,
          builder: (_, __) {
            final maxCount = _funnelCounts[0].toDouble();
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_funnelStages.length, (i) {
                final count = _funnelCounts[i];
                final frac = count / maxCount;
                final convRate = i == 0
                    ? '100%'
                    : '${(count / _funnelCounts[i - 1] * 100).toStringAsFixed(1)}%';
                final numStr = count.toString().replaceAllMapped(
                    RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]},');

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 82,
                        child: Text(
                          _funnelStages[i],
                          style: tt.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 34,
                              decoration: BoxDecoration(
                                color: AppColors.grey350.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: (frac * _anim.value).clamp(0.0, 1.0),
                              child: Container(
                                height: 34,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    gold,
                                    gold.withValues(alpha: 0.65),
                                  ]),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    numStr,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 44,
                        child: Text(
                          convRate,
                          textAlign: TextAlign.right,
                          style: tt.bodySmall?.copyWith(
                            fontSize: 11,
                            color: i == 0
                                ? AppColors.grey250
                                : gold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}

// ── Orders Trend Line Chart ───────────────────────────────────────────────────

class _OrdersTrendChart extends StatefulWidget {
  final String id;
  const _OrdersTrendChart({required this.id});
  @override
  State<_OrdersTrendChart> createState() => _OrdersTrendState();
}

class _OrdersTrendState extends State<_OrdersTrendChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1400));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (i) {
        if (!_done && i.visibleFraction > 0.15) {
          _done = true;
          _ctrl.forward();
        }
      },
      child: _Card(
        title: 'Daily Confirmed Orders — Apr 6 → May 13',
        source:
            'Firebase Analytics BQ · analytics_498514583 · peak 1,468/day · ~80% growth over 6 weeks',
        chartHeight: 220,
        chart: AnimatedBuilder(
          animation: _anim,
          builder: (_, __) {
            final n = (_orderSpots.length * _anim.value)
                .ceil()
                .clamp(1, _orderSpots.length);
            return LineChart(_ordersData(_orderSpots.sublist(0, n)));
          },
        ),
      ),
    );
  }

  LineChartData _ordersData(List<FlSpot> spots) {
    final gold = AppColors.primaryColor;
    return LineChartData(
      minX: 0, maxX: 30, minY: 0, maxY: 1700,
      clipData: const FlClipData.all(),
      gridData: _hGrid(),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: _hidden()),
        rightTitles: AxisTitles(sideTitles: _hidden()),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            interval: 400,
            getTitlesWidget: (v, _) => Text(
              '${v.toInt()}',
              style: TextStyle(fontSize: 10, color: AppColors.grey250),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            interval: 12,
            getTitlesWidget: (v, _) {
              final x = v.toInt();
              if (x == 0) return Text('Apr 6', style: TextStyle(fontSize: 9, color: AppColors.grey250));
              if (x == 12) return Text('Apr 18', style: TextStyle(fontSize: 9, color: AppColors.grey250));
              if (x == 24) return Text('May 7', style: TextStyle(fontSize: 9, color: AppColors.grey250));
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
      lineTouchData: LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => AppColors.black400,
          getTooltipItems: (list) => list.map((s) {
            return LineTooltipItem(
              '${_orderLabel(s.x.toInt())}\n${s.y.toInt()} orders',
              const TextStyle(
                  color: AppColors.white, fontSize: 12, height: 1.5),
            );
          }).toList(),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          curveSmoothness: 0.3,
          color: gold,
          barWidth: 2.5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
              radius: spot.y == 1468 ? 6 : 2.5,
              color: spot.y == 1468 ? AppColors.red : gold,
              strokeColor: Colors.transparent,
              strokeWidth: 0,
            ),
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                gold.withValues(alpha: 0.22),
                gold.withValues(alpha: 0.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ── ANR by Version Bar Chart ──────────────────────────────────────────────────

class _AnrChart extends StatefulWidget {
  final String id;
  const _AnrChart({required this.id});
  @override
  State<_AnrChart> createState() => _AnrState();
}

class _AnrState extends State<_AnrChart> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.id),
      onVisibilityChanged: (i) {
        if (!_done && i.visibleFraction > 0.2) {
          _done = true;
          _ctrl.forward();
        }
      },
      child: _Card(
        title: 'ANR Count by Version — April 2026',
        source:
            'Firebase Crashlytics BQ · 228 ANRs in v1.4.1 → 2 in v1.8.0 (99% reduction)',
        chart: AnimatedBuilder(
          animation: _anim,
          builder: (_, __) => BarChart(_anrData()),
        ),
      ),
    );
  }

  // Colour maps high→red, low→gold for clear visual encoding
  Color _barColor(int i) {
    if (i == _anrLabels.length - 1) return AppColors.primaryColor; // v1.8 gold
    final t = i / (_anrLabels.length - 2); // 0=red end, 1=yellow end
    return Color.lerp(const Color(0xFFEF5350), const Color(0xFFFFA726), t)!;
  }

  BarChartData _anrData() {
    return BarChartData(
      maxY: 260,
      alignment: BarChartAlignment.spaceAround,
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => AppColors.black400,
          getTooltipItem: (g, gi, rod, _) => BarTooltipItem(
            '${_anrLabels[gi]}\n${_anrCounts[gi].toInt()} ANRs',
            const TextStyle(
                color: AppColors.white, fontSize: 12, height: 1.5),
          ),
        ),
      ),
      gridData: _hGrid(),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: _hidden()),
        rightTitles: AxisTitles(sideTitles: _hidden()),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 50,
            getTitlesWidget: (v, _) => Text(
              '${v.toInt()}',
              style: TextStyle(fontSize: 9, color: AppColors.grey250),
            ),
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 24,
            getTitlesWidget: (v, _) {
              final i = v.toInt();
              if (i < 0 || i >= _anrLabels.length) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  _anrLabels[i],
                  style: TextStyle(
                    fontSize: 9,
                    color: i == _anrLabels.length - 1
                        ? AppColors.primaryColor
                        : AppColors.grey250,
                    fontWeight: i == _anrLabels.length - 1
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      barGroups: List.generate(_anrLabels.length, (i) => BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: _anrCounts[i] * _anim.value,
            color: _barColor(i),
            width: 26,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ],
      )),
    );
  }
}
