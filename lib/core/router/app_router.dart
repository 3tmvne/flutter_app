import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fffff/features/home/presentation/pages/home_page.dart';

// Placeholder pages for routing - these will be replaced with actual implementations
class PlaceholderPage extends StatelessWidget {
  final String name;
  const PlaceholderPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(child: Text('$name Page')),
    );
  }
}

/// GoRouter configuration for the application
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/assessment',
        builder: (context, state) => const PlaceholderPage(name: 'Assessment'),
      ),
      GoRoute(
        path: '/centers',
        builder: (context, state) => const PlaceholderPage(name: 'Centers'),
      ),
      GoRoute(
        path: '/chatbot',
        builder: (context, state) => const PlaceholderPage(name: 'Chatbot'),
      ),
      GoRoute(
        path: '/content',
        builder: (context, state) => const PlaceholderPage(name: 'Content'),
      ),
      GoRoute(
        path: '/content/:id',
        builder: (context, state) => PlaceholderPage(
          name: 'Content: ${state.pathParameters['id']}',
        ),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const PlaceholderPage(name: 'Profile'),
      ),
    ],
  );
});
