import 'package:flutter/material.dart';

class RecipeItem {
  final String title;
  final String duration;
  final String tag;
  final Color imageColor;
  final String imageUrl;

  const RecipeItem({
    required this.title,
    required this.duration,
    required this.tag,
    required this.imageColor,
    required this.imageUrl,
  });
}

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const List<RecipeItem> _recipes = [
    RecipeItem(
      title: 'Spicy Tacos',
      duration: '20 min',
      tag: 'Spicy',
      imageColor: Color(0xFFD4845A),
      imageUrl: 'https://i.pinimg.com/736x/0f/ce/86/0fce86eb16174b6f1a274f3aead89749.jpg',
    ),
    RecipeItem(
      title: 'Chocolate Cake',
      duration: '45 min',
      tag: 'Dessert',
      imageColor: Color(0xFF6B3E26),
     imageUrl: 'https://i.pinimg.com/1200x/be/4f/24/be4f24be56ca1176e69049a392d3c280.jpg',
    ),
    RecipeItem(
      title: 'Caesar Salad',
      duration: '15 min',
      tag: 'Easy',
      imageColor: Color.fromARGB(255, 218, 168, 20),
      imageUrl: 'https://i.pinimg.com/1200x/2f/8b/1a/2f8b1a4e51a6eb2252dfefce7015eb48.jpg',
    ),
    RecipeItem(
      title: 'Salmon',
      duration: '35 min',
      tag: 'Medium',
      imageColor: Color(0xFFE07B39),
      imageUrl: 'https://i.pinimg.com/736x/55/bd/db/55bddb038e45559d90b925a6765c2dc3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F3F0),
        elevation: 0,
        leading: const BackButton(color: Colors.black87),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'My Favorites',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.favorite,
              color: Color(0xFFFF8C42),
              size: 22,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: const Color.fromARGB(255, 232, 160, 83),
              child: const Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.separated(
          itemCount: _recipes.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return _RecipeCard(recipe: _recipes[index]);
          },
        ),
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  final RecipeItem recipe;

  const _RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Food image placeholder
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 72,
                height: 72,
                color: recipe.imageColor,
                child:Image.network(
                  recipe.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                )
              ),
            ),
            const SizedBox(width: 14),
            // Title + meta
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 13, color: Colors.grey),
                      const SizedBox(width: 3),
                      Text(
                        recipe.duration,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(width: 6),
                      const Text('|',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      const SizedBox(width: 6),
                      Text(
                        recipe.tag,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Orange heart icon
            const Icon(
              Icons.favorite,
              color: Color(0xFFFF8C42),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}