import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 80, color: Colors.green),
            SizedBox(height: 20),
            Text("Favorites Screen", style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}