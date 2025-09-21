import 'package:flutter/material.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/signin';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // komponen kecil buat label + tanda *
    Widget requiredLabel(String text) => Row(
      children: [
        Text(text, style: const TextStyle(fontSize: 13)),
        const Text(' *', style: TextStyle(color: Colors.red, fontSize: 13)),
      ],
    );

    // tombol biru dengan gradient (UI-only)
    Widget primaryButton(String label, VoidCallback onTap) => GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            colors: [Color(0xFF1E88FF), Color(0xFF2070FF)],
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: const Color(0xFF1E88FF).withOpacity (0.25),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ], 
        ), // BoxDecoration
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ), // Text
      ), // Container
    ); // GestureDetector

    return Scaffold(
      body: SafeArea(
        child: Center( 
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // logo
                Image.asset(
                'assets/images/justduit.png',
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 18),

              // judul
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hi, Welcome Back to JustDuit',
                    style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.w700,
                    ),                    
                  ),
                ), 
              ),
              const SizedBox(height: 14),

              // card form (dibangun manual)
              Container(
                width: 360,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.fromLTRB(
                  18,
                  18,
                  18,
                  22,
                ), // kiri,atas,kanan,bawah
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ), // BoxDecoration
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    requiredLabel('Email Address'),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ), // InputDecoration
                    ), // TextField
                    const SizedBox(height: 14),

                    requiredLabel('Password'),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _pass,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                      ), // InputDecoration
                    ), // TextField
                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {},
                       child: const Text(
                         'Forgot Password',
                         style: TextStyle(fontSize: 12),
                        ), // Text
                      ), // TextButton
                    ), // Align
                    const SizedBox(height: 6),

                    primaryButton('Sign In Now', () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sign In tapped')),
                      );
                    }),
                    const SizedBox(height: 14),

                    Center(
                      child: TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, SignupScreen.route),
                        child: const Text(
                          'Create New Account',
                          style: TextStyle(fontSize: 13),
                        ), // Text
                      ), // TextButton
                     ), 
                  ], 
                ),
              ),
            ], 
            ),
          ), 
        ), 
      ), 
    ); 
  }
}