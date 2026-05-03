import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fffff/core/constants/app_colors.dart';
import 'package:fffff/core/l10n/app_localizations_ext.dart';

/// Bottom navigation bar for the home screen
class HomeBottomNavBar extends ConsumerWidget {
  /// Currently selected nav item index
  final int selectedIndex;

  /// Creates a HomeBottomNavBar
  const HomeBottomNavBar({required this.selectedIndex, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _NavItem(
                icon: Icons.home_outlined,
                selectedIcon: Icons.home,
                label: context.l10n.navHome,
                isSelected: selectedIndex == 0,
                onTap: () => context.go('/home'),
              ),
              _NavItem(
                icon: Icons.location_on_outlined,
                selectedIcon: Icons.location_on,
                label: context.l10n.navMap,
                isSelected: selectedIndex == 1,
                onTap: () => context.push('/centers'),
              ),
              _NavItem(
                icon: Icons.chat_bubble_outline,
                selectedIcon: Icons.chat_bubble,
                label: context.l10n.navChat,
                isSelected: selectedIndex == 2,
                onTap: () => context.push('/chatbot'),
              ),
              _NavItem(
                icon: Icons.person_outline,
                selectedIcon: Icons.person,
                label: context.l10n.navProfile,
                isSelected: selectedIndex == 3,
                onTap: () => context.push('/profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Individual navigation item
class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      enabled: true,
      onTap: onTap,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? selectedIcon : icon,
                color: isSelected
                    ? AppColors.primaryGreen
                    : AppColors.tertiaryText,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected
                      ? AppColors.primaryGreen
                      : AppColors.tertiaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
