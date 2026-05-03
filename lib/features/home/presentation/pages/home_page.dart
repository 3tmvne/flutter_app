import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fffff/core/constants/app_colors.dart';
import 'package:fffff/core/l10n/app_localizations_ext.dart';
import 'package:fffff/core/providers/locale_provider.dart';
import 'package:fffff/features/home/presentation/notifier/home_notifier.dart';
import 'package:fffff/features/home/presentation/notifier/home_state.dart';
import 'package:fffff/features/home/presentation/widgets/feature_card_widget.dart';
import 'package:fffff/features/home/presentation/widgets/home_bottom_nav_bar.dart';
import 'package:fffff/features/home/presentation/widgets/language_toggle_button.dart';
import 'package:fffff/features/home/presentation/widgets/notification_banner_widget.dart';
import 'package:fffff/features/home/presentation/widgets/stats_row_widget.dart';

/// Home dashboard page
/// 
/// Main navigation hub where users land after language selection.
/// Displays welcome greeting, statistics, notification banners, and feature shortcuts.
class HomePage extends ConsumerWidget {
  /// Creates a HomePage
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    return homeState.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.read(homeNotifierProvider.notifier).refreshStats(),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
      data: (state) => Scaffold(
        appBar: null,
        body: RefreshIndicator(
          onRefresh: () async {
            await ref.read(homeNotifierProvider.notifier).refreshStats();
            await ref.read(homeNotifierProvider.notifier).refreshBanners();
          },
          child: CustomScrollView(
            slivers: [
              _buildHeader(context),
              _buildWelcomeCard(context, ref, state),
              if (state.banners.isNotEmpty)
                _buildNotificationBanners(context, ref, state),
              _buildFeatureGrid(context, ref, state),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 100),
                sliver: SliverToBoxAdapter(child: Container()),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const HomeBottomNavBar(selectedIndex: 0),
      ),
    );
  }

  /// Builds the header with logo and language toggle
  Widget _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left: App logo + name
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'ScreenAware',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkText,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
            // Right: Language toggle button
            const LanguageToggleButton(),
          ],
        ),
      ),
    );
  }

  /// Builds the welcome card with greeting and stats
  Widget _buildWelcomeCard(
    BuildContext context,
    WidgetRef ref,
    dynamic state,
  ) {
    final greeting = _getGreeting(context, ref);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryGreen.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                greeting,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                context.l10n.homeWelcomeMessage,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 16),
              // Mini stats row (if stats loaded)
              if (state.homeStats != null)
                StatsRowWidget(stats: state.homeStats),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the notification banners section
  Widget _buildNotificationBanners(
    BuildContext context,
    WidgetRef ref,
    dynamic state,
  ) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final banner = state.banners[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: NotificationBannerWidget(
                banner: banner,
                onTap: () {
                  if (banner.actionRoute != null) {
                    context.push(banner.actionRoute!);
                  }
                },
                onDismiss: () {
                  ref
                      .read(homeNotifierProvider.notifier)
                      .dismissBanner(banner.id);
                },
              ),
            );
          },
          childCount: state.banners.length,
        ),
      ),
    );
  }

  /// Builds the feature grid (2x2 layout)
  Widget _buildFeatureGrid(
    BuildContext context,
    WidgetRef ref,
    dynamic state,
  ) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.95,
        ),
        delegate: SliverChildListDelegate([
          FeatureCardWidget(
            icon: Icons.assignment_outlined,
            title: context.l10n.featureAssessmentTitle,
            subtitle: context.l10n.featureAssessmentSubtitle,
            color: AppColors.primaryGreen,
            isSelected:
                state.selectedFeature == HomeFeature.assessment,
            onTap: () {
              ref
                  .read(homeNotifierProvider.notifier)
                  .selectFeature(HomeFeature.assessment);
              context.push('/assessment');
            },
          ),
          FeatureCardWidget(
            icon: Icons.location_on_outlined,
            title: context.l10n.featureCentersTitle,
            subtitle: context.l10n.featureCentersSubtitle,
            color: const Color(0xFF2D6A4F),
            badge: state.homeStats?.nearestCenterDistance != null
                ? '${state.homeStats!.nearestCenterDistance!.toStringAsFixed(1)} km'
                : null,
            isSelected: state.selectedFeature == HomeFeature.centers,
            onTap: () {
              ref
                  .read(homeNotifierProvider.notifier)
                  .selectFeature(HomeFeature.centers);
              context.push('/centers');
            },
          ),
          FeatureCardWidget(
            icon: Icons.chat_bubble_outline,
            title: context.l10n.featureChatbotTitle,
            subtitle: context.l10n.featureChatbotSubtitle,
            color: const Color(0xFF40916C),
            badge: state.homeStats?.lastChatMessageAt != null
                ? _formatTimeSince(state.homeStats!.lastChatMessageAt!)
                : null,
            isSelected: state.selectedFeature == HomeFeature.chatbot,
            onTap: () {
              ref
                  .read(homeNotifierProvider.notifier)
                  .selectFeature(HomeFeature.chatbot);
              context.push('/chatbot');
            },
          ),
          FeatureCardWidget(
            icon: Icons.menu_book_outlined,
            title: context.l10n.featureContentTitle,
            subtitle: context.l10n.featureContentSubtitle,
            color: const Color(0xFF52B788),
            isSelected: state.selectedFeature == HomeFeature.content,
            onTap: () {
              ref
                  .read(homeNotifierProvider.notifier)
                  .selectFeature(HomeFeature.content);
              context.push('/content');
            },
          ),
        ]),
      ),
    );
  }

  /// Gets the appropriate greeting based on time of day
  String _getGreeting(BuildContext context, WidgetRef ref) {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return context.l10n.homeGreetingMorning;
    } else if (hour < 18) {
      return context.l10n.homeGreetingAfternoon;
    } else {
      return context.l10n.homeGreetingEvening;
    }
  }

  /// Formats a DateTime to a human-readable time difference string
  String _formatTimeSince(DateTime dateTime) {
    final diff = DateTime.now().difference(dateTime);
    if (diff.inDays > 0) return '${diff.inDays}j';
    if (diff.inHours > 0) return '${diff.inHours}h';
    return '${diff.inMinutes}min';
  }
}
