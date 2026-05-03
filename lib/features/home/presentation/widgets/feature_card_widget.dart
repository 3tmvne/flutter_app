import 'package:flutter/material.dart';
import 'package:fffff/core/constants/app_colors.dart';

/// Feature card widget for home dashboard
/// 
/// Displays a single feature (Assessment, Centers, Chatbot, Content)
/// with icon, title, subtitle, optional badge, and tap feedback.
class FeatureCardWidget extends StatelessWidget {
  /// Icon to display
  final IconData icon;

  /// Feature title text
  final String title;

  /// Feature subtitle text
  final String subtitle;

  /// Primary color for the card
  final Color color;

  /// Optional badge text (distance, time, etc.)
  final String? badge;

  /// Whether the card is currently selected (for animation)
  final bool isSelected;

  /// Callback when card is tapped
  final VoidCallback onTap;

  /// Creates a FeatureCardWidget
  const FeatureCardWidget({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.isSelected,
    required this.onTap,
    this.badge,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$title - $subtitle',
      enabled: true,
      onTap: onTap,
      child: AnimatedScale(
        scale: isSelected ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          elevation: isSelected ? 8 : 2,
          shadowColor: color.withOpacity(0.2),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: Icon circle + badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Icon in colored circle
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, color: color, size: 24),
                      ),
                      // Badge (if provided)
                      if (badge != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.softGold.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            badge!,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkText,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const Spacer(),
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkText,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Subtitle
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondaryText,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
