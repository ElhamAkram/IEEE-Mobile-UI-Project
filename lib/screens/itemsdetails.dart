import 'package:flutter/material.dart';

// ========= داتا كل الأكلات =========
final Map<String, Map<String, dynamic>> recipesData = {
  "Creemy pasta": {
    "ingredients": [
      {"name": "Pasta", "amount": "200g", "icon": "🍝"},
      {"name": "Heavy Cream", "amount": "1 cup", "icon": "🥛"},
      {"name": "Garlic", "amount": "2 cloves", "icon": "🧄"},
      {"name": "Parmesan", "amount": "1/4 cup", "icon": "🧀"},
      {"name": "Olive Oil", "amount": "2 tbsp", "icon": "🫒"},
      {"name": "Salt & Pepper", "amount": "To taste", "icon": "🧂"},
    ],
    "steps": [
      {"step": 1, "title": "Boil Pasta", "desc": "Cook pasta until al dente, then drain.", "time": "10 min"},
      {"step": 2, "title": "Sauté Garlic", "desc": "Fry garlic in olive oil until golden.", "time": "3 min"},
      {"step": 3, "title": "Add Cream", "desc": "Pour cream and simmer on low heat.", "time": "4 min"},
      {"step": 4, "title": "Mix & Serve", "desc": "Toss pasta in sauce, top with Parmesan.", "time": "3 min"},
    ],
  },
  "Tuna Salad": {
    "ingredients": [
      {"name": "Tuna Can", "amount": "1 can", "icon": "🐟"},
      {"name": "Lettuce", "amount": "2 cups", "icon": "🥬"},
      {"name": "Tomato", "amount": "1 medium", "icon": "🍅"},
      {"name": "Cucumber", "amount": "1/2", "icon": "🥒"},
      {"name": "Olive Oil", "amount": "1 tbsp", "icon": "🫒"},
      {"name": "Lemon", "amount": "1/2", "icon": "🍋"},
    ],
    "steps": [
      {"step": 1, "title": "Prep Veggies", "desc": "Chop tomato and cucumber into cubes.", "time": "5 min"},
      {"step": 2, "title": "Mix Salad", "desc": "Toss lettuce, tomato and cucumber.", "time": "2 min"},
      {"step": 3, "title": "Add Tuna", "desc": "Drain tuna and add on top.", "time": "1 min"},
      {"step": 4, "title": "Dress & Serve", "desc": "Drizzle olive oil and lemon juice.", "time": "1 min"},
    ],
  },
  "Burger": {
    "ingredients": [
      {"name": "Beef Patty", "amount": "200g", "icon": "🥩"},
      {"name": "Burger Bun", "amount": "1", "icon": "🍞"},
      {"name": "Lettuce", "amount": "2 leaves", "icon": "🥬"},
      {"name": "Tomato", "amount": "2 slices", "icon": "🍅"},
      {"name": "Cheese", "amount": "1 slice", "icon": "🧀"},
      {"name": "Ketchup", "amount": "2 tbsp", "icon": "🍅"},
    ],
    "steps": [
      {"step": 1, "title": "Season Patty", "desc": "Season beef with salt and pepper.", "time": "2 min"},
      {"step": 2, "title": "Grill Patty", "desc": "Cook patty on high heat each side.", "time": "8 min"},
      {"step": 3, "title": "Toast Bun", "desc": "Toast the bun until golden.", "time": "2 min"},
      {"step": 4, "title": "Assemble", "desc": "Layer lettuce, patty, cheese, tomato.", "time": "2 min"},
    ],
  },
  "Stake": {
    "ingredients": [
      {"name": "Beef Steak", "amount": "300g", "icon": "🥩"},
      {"name": "Butter", "amount": "2 tbsp", "icon": "🧈"},
      {"name": "Garlic", "amount": "3 cloves", "icon": "🧄"},
      {"name": "Rosemary", "amount": "2 sprigs", "icon": "🌿"},
      {"name": "Olive Oil", "amount": "1 tbsp", "icon": "🫒"},
      {"name": "Salt & Pepper", "amount": "To taste", "icon": "🧂"},
    ],
    "steps": [
      {"step": 1, "title": "Season Steak", "desc": "Rub steak with salt, pepper and oil.", "time": "5 min"},
      {"step": 2, "title": "Sear Steak", "desc": "Sear on high heat 3 min each side.", "time": "6 min"},
      {"step": 3, "title": "Baste", "desc": "Add butter, garlic, rosemary and baste.", "time": "3 min"},
      {"step": 4, "title": "Rest & Serve", "desc": "Let steak rest before slicing.", "time": "5 min"},
    ],
  },
};

class ItemDetails extends StatefulWidget {
  final Map data;
  const ItemDetails({super.key, required this.data});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool isFavorite = false;
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final String image = widget.data["Image"] ?? "";
    final String title = widget.data["title"] ?? "Recipe";
    final String time = widget.data["time"] ?? "30m";

    // جيب داتا الأكلة الصح أو fallback للـ default
    final recipeInfo = recipesData[title] ?? recipesData["Creemy pasta"]!;
    final List ingredients = recipeInfo["ingredients"];
    final List steps = recipeInfo["steps"];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),
      body: CustomScrollView(
        slivers: [
          // ======= App Bar مع الصورة ======
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: const Color(0xFFFFF8F2),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: const Icon(Icons.arrow_back, color: Colors.black87),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => setState(() => isFavorite = !isFavorite),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? const Color(0xFFE53935) : Colors.black87,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  image.isNotEmpty
                      ? Image.network(
                    image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[200],
                      child: const Icon(Icons.restaurant, size: 80, color: Colors.grey),
                    ),
                  )
                      : Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.restaurant, size: 80, color: Colors.grey),
                  ),
                  Positioned(
                    bottom: 0, left: 0, right: 0, height: 90,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Color(0xFFFFF8F2), Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ======= المحتوى =======
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // العنوان
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Stats Row
                  Row(
                    children: [
                      _statChip(Icons.access_time, time, const Color(0xFFFF8C00)),
                      const SizedBox(width: 8),
                      _statChip(Icons.bar_chart, "Easy", const Color(0xFF4CAF50)),
                      const SizedBox(width: 8),
                      _statChip(Icons.star, "4.8", const Color(0xFFFFB300)),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Tabs
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        _tabButton("Ingredients", 0),
                        _tabButton("Steps", 1),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // المحتوى
                  _selectedTab == 0
                      ? _buildIngredients(ingredients)
                      : _buildSteps(steps),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statChip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: color)),
        ],
      ),
    );
  }

  Widget _tabButton(String label, int index) {
    final bool isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFF8C00) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIngredients(List ingredients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${ingredients.length} Items",
            style: TextStyle(fontSize: 12, color: Colors.grey[500])),
        const SizedBox(height: 10),
        ...ingredients.map(
              (item) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40, height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF8C00).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(item["icon"], style: const TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(item["name"],
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                ),
                Text(item["amount"],
                    style: TextStyle(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSteps(List steps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${steps.length} Steps",
            style: TextStyle(fontSize: 12, color: Colors.grey[500])),
        const SizedBox(height: 10),
        ...steps.map(
              (item) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 34, height: 34,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF8C00),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text("${item["step"]}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ),
                  ),
                  if (item["step"] != steps.length)
                    Container(
                      width: 2, height: 60,
                      color: const Color(0xFFFF8C00).withOpacity(0.2),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item["title"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xFF2D2D2D))),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFF8C00).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(item["time"],
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFFF8C00),
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(item["desc"],
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey[600], height: 1.4)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}