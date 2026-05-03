import 'package:flutter/material.dart';
import 'package:fffff/core/constants/app_colors.dart';
import 'package:fffff/core/l10n/app_localizations_ext.dart';
import 'package:fffff/features/home/domain/entities/home_stats_entity.dart';

/// Widget displaying a row of statistics in the welcome card
class StatsRowWidget extends StatelessWidget {
  /// Home statistics to display
  final HomeStatsEntity stats;

  /// Creates a StatsRowWidget
  const StatsRowWidget({required this.stats, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (stats.totalAssessmentsCompleted > 0) ...[
          _StatChip(
            icon: Icons.check_circle_outline,
            value: stats.totalAssessmentsCompleted.toString(),
            label: context.l10n.statsAssessments,
          ),
          const SizedBox(width: 12),
        ],
        if (stats.nearestCenterDistance != null) ...[
          _StatChip(
            icon: Icons.location_on_outlined,
            value:
                '${stats.nearestCenterDistance!.toStringAsFixed(1)} km',
            label: context.l10n.statsNearestCenter,
          ),
        ],
      ],
    );
  }
}

/// Individual stat chip component
class _StatChip extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatChip({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 14),
          const SizedBox(width: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
