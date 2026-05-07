import 'package:flutter/material.dart';
import 'dashboard_components.dart';

class FrenchDashboardScreen extends StatefulWidget {
  const FrenchDashboardScreen({super.key});

  @override
  State<FrenchDashboardScreen> createState() => _FrenchDashboardScreenState();
}

class _FrenchDashboardScreenState extends State<FrenchDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        titleSpacing: 16,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.health_and_safety_outlined,
              color: Color(0xFF2D8A4D),
              size: 22,
            ),
            SizedBox(width: 8),
            Text(
              'ScreenAware',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF163422),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.language_rounded, size: 18),
              label: const Text('FR / AR'),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1D5F35),
                backgroundColor: const Color(0xFFE8F2EA),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeroBannerCard(),
              const SizedBox(height: 16),
              const InfoAlertCard(),
              const SizedBox(height: 20),
              const SectionHeader(title: 'Menu rapide'),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.05,
                children: [
                  DashboardMenuCard(
                    icon: Icons.health_and_safety_outlined,
                    title: 'Évaluation des risques',
                    subtitle: 'Bilan rapide',
                    accentColor: const Color(0xFF2D8A4D),
                    onTap: () => debugPrint('Évaluation des risques clicked'),
                  ),
                  DashboardMenuCard(
                    icon: Icons.location_on_outlined,
                    title: 'Centres de dépistage',
                    subtitle: 'À proximité',
                    accentColor: const Color(0xFFE38B2C),
                    onTap: () => debugPrint('Centres de dépistage clicked'),
                  ),
                  DashboardMenuCard(
                    icon: Icons.chat_bubble_outline,
                    title: 'Assistant santé',
                    subtitle: 'IA & Conseils',
                    accentColor: const Color(0xFF4A8FE7),
                    onTap: () => debugPrint('Assistant santé clicked'),
                  ),
                  DashboardMenuCard(
                    icon: Icons.menu_book_outlined,
                    title: 'Guides et ressources',
                    subtitle: 'Bibliothèque',
                    accentColor: const Color(0xFF8C6C3E),
                    onTap: () => debugPrint('Guides et ressources clicked'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const AppointmentCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF2D8A4D),
        unselectedItemColor: const Color(0xFF8D9490),
        elevation: 10,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map_rounded),
            label: 'Carte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
