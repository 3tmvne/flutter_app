import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fffff/core/constants/app_colors.dart';
import 'package:fffff/core/providers/locale_provider.dart';
import 'package:fffff/features/home/domain/entities/notification_banner_entity.dart';

/// Notification banner widget for health campaigns
/// 
/// Displays a dismissible health campaign banner with emoji icon,
/// localized title and body, and optional action link.
class NotificationBannerWidget extends ConsumerWidget {
  /// Banner entity to display
  final NotificationBannerEntity banner;

  /// Callback when banner is tapped
  final VoidCallback onTap;

  /// Callback when banner is dismissed
  final VoidCallback onDismiss;

  /// Creates a NotificationBannerWidget
  const NotificationBannerWidget({
    required this.banner,
    required this.onTap,
    required this.onDismiss,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final title = locale == 'ar' ? banner.titleAr : banner.titleFr;
    final body = locale == 'ar' ? banner.bodyAr : banner.bodyFr;

    return Semantics(
      label: '$title - $body',
      enabled: true,
      onDismiss: onDismiss,
      onTap: onTap,
      child: Dismissible(
        key: Key(banner.id),
        direction: DismissDirection.endToStart,
        onDismissed: (_) => onDismiss(),
        background: Container(
          alignment: AlignmentDirectional.centerEnd,
          padding: const EdgeInsetsDirectional.only(end: 20),
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.delete_outline, color: Colors.white),
        ),
        child: Material(
          color: _getBannerColor(banner.priority),
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  // Icon emoji in circle
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      banner.iconEmoji,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.darkText,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          body,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.secondaryText,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  // Chevron
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.secondaryText,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Gets the background color for the banner based on priority
  Color _getBannerColor(BannerPriority priority) {
    switch (priority) {
      case BannerPriority.high:
        return const Color(0xFFFFF3E0); // Light amber
      case BannerPriority.medium:
        return const Color(0xFFF1F8F4); // Light green
      case BannerPriority.low:
        return const Color(0xFFF5F5F5); // Light gray
    }
  }
}
