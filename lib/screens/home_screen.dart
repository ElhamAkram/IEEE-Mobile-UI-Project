import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: const Color(0xFFE8622A), 
      ),
      body: const Center(
        child: Text(
          'Welcome to Home Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}