import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myapp/screens/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToDashboard();
  }

  // Fungsi navigasi setelah delay
  void _navigateToDashboard() {
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, DashboardScreen.route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ✅ pakai gambar logo dari assets/images
            Image.asset(
              'assets/images/justduit.png', // sama seperti di login_screen.dart
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),

            const CircularProgressIndicator(
              color: Color(0xFF1E88F8),
            ),
            const SizedBox(height: 16),

            Text(
              'Sabar Sayang...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
