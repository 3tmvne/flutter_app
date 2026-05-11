import 'package:flutter/material.dart';
import 'language_card.dart';
import 'french_dashboard_screen.dart';
import 'arabic_home_screen.dart';

void main() {
  runApp(const ScreenAwareApp());
}

class ScreenAwareApp extends StatelessWidget {
  const ScreenAwareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScreenAware',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2D8A4D),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F2),
      ),
      home: const LanguageScreen(),
    );
  }
}

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F2),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDFF3E8),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withAlpha(26),
                          blurRadius: 24,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.shield_outlined,
                      size: 42,
                      color: Color(0xFF1B7A3F),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'ScreenAware',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF143C24),
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your privacy is fully protected',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFF6B7280),
                        ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: LanguageCard(
                          label: 'French',
                          flag: '🇫🇷',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const FrenchDashboardScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: LanguageCard(
                          label: 'Arabic',
                          flag: '🇲🇦',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ArabicHomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DotIndicator(active: true),
                      DotIndicator(active: false),
                      DotIndicator(active: false),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Learn more about anonymity →'),
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
