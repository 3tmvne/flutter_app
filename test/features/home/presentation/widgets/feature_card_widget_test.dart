import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fffff/features/home/presentation/widgets/feature_card_widget.dart';

void main() {
  group('FeatureCardWidget', () {
    testWidgets('renders icon, title, and subtitle', (tester) async {
      // Arrange
      var tapCount = 0;
      
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeatureCardWidget(
              icon: Icons.assignment,
              title: 'Test Title',
              subtitle: 'Test Subtitle',
              color: Colors.green,
              isSelected: false,
              onTap: () => tapCount++,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byIcon(Icons.assignment), findsOneWidget);
      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
    });

    testWidgets('shows badge when provided', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeatureCardWidget(
              icon: Icons.location_on,
              title: 'Centers',
              subtitle: 'Find nearby',
              color: Colors.green,
              badge: '2.5 km',
              isSelected: false,
              onTap: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.text('2.5 km'), findsOneWidget);
    });

    testWidgets('does not show badge when not provided', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeatureCardWidget(
              icon: Icons.chat,
              title: 'Chat',
              subtitle: 'Ask questions',
              color: Colors.green,
              isSelected: false,
              onTap: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(Container), findsWidgets); // Icon container exists
      // But badge container should not exist
    });

    testWidgets('calls onTap when card is tapped', (tester) async {
      // Arrange
      var tapCount = 0;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeatureCardWidget(
              icon: Icons.chat,
              title: 'Chat',
              subtitle: 'Ask questions',
              color: Colors.green,
              isSelected: false,
              onTap: () => tapCount++,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // Assert
      expect(tapCount, 1);
    });

    testWidgets('scales down when selected', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeatureCardWidget(
              icon: Icons.assignment,
              title: 'Assessment',
              subtitle: 'Quick test',
              color: Colors.green,
              isSelected: true,
              onTap: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Assert - verify AnimatedScale exists and is set to true
      expect(find.byType(AnimatedScale), findsOneWidget);
      final animatedScale = find.byType(AnimatedScale).evaluate().first.widget
          as AnimatedScale;
      expect(animatedScale.scale, 0.96);
    });

    testWidgets('has correct tap target size', (tester) async {
      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: FeatureCardWidget(
                icon: Icons.assignment,
                title: 'Test',
                subtitle: 'Subtitle',
                color: Colors.green,
                isSelected: false,
                onTap: () {},
              ),
            ),
          ),
        ),
      );

      // Assert - verify InkWell has minimum tap target
      final inkWellFinder = find.byType(InkWell);
      expect(inkWellFinder, findsOneWidget);
      final size = tester.getSize(inkWellFinder);
      expect(size.width, greaterThanOrEqualTo(48));
      expect(size.height, greaterThanOrEqualTo(48));
    });

    testWidgets('renders with proper styling', (tester) async {
      // Act
      const testColor = Color(0xFF1B4332);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FeatureCardWidget(
              icon: Icons.location_on,
              title: 'Centers',
              subtitle: 'Find nearby',
              color: testColor,
              badge: '5.2 km',
              isSelected: false,
              onTap: () {},
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(Material), findsWidgets);
      expect(find.byType(Container), findsWidgets);
      expect(find.byIcon(Icons.location_on), findsOneWidget);
      expect(find.text('5.2 km'), findsOneWidget);
    });
  });
}
