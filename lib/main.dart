import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
        title: const Text('PRAKTIKUM MOBILE LANJUT'),
      ),
      body: const Center(
        child: Text(
          'Hallo Nama Gue Zahra Citra Apriliana',
          textAlign: TextAlign.center,
          // style: TextStyle(fontSize: 16),
        )
      ) 
      ) 
    );
  }
}
