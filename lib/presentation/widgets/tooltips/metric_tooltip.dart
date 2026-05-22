import 'package:flutter/material.dart';

class MetricTooltip extends StatefulWidget {
  final String label;
  final String value;
  final Widget child;

  const MetricTooltip({
    Key? key,
    required this.label,
    required this.value,
    required this.child,
  }) : super(key: key);

  @override
  _MetricTooltipState createState() => _MetricTooltipState();
}

class _MetricTooltipState extends State<MetricTooltip> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '${widget.label}: ${widget.value}',
      showDuration: const Duration(seconds: 3),
      child: widget.child,
    );
  }
}
