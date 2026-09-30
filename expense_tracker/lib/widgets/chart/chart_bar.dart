import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  // A value between 0 and 1 that determines how "full" the bar is.
  final double fill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final safeFill = fill.isNaN ? 0.0 : fill.clamp(0.0, 1.0);

    final barColor = (isDarkMode
            ? theme.colorScheme.secondary
            : theme.colorScheme.primary)
        .withOpacity(0.65);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Tooltip(
        message: '${(safeFill * 100).toStringAsFixed(0)}%',
        // Animation: bars grow from 0 and smoothly resize when data changes.
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: safeFill),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutCubic,
          builder: (context, value, _) => FractionallySizedBox(
            heightFactor: value,
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                color: barColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}