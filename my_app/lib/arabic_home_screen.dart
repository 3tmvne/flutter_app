import 'package:flutter/material.dart';

class ArabicHomeScreen extends StatelessWidget {
  const ArabicHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الرئيسية'),
      ),
      body: const Center(
        child: Text(
          'أهلاً بك',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
