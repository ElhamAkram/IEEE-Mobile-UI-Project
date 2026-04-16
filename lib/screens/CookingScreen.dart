import 'package:flutter/material.dart';

class CookingScreen extends StatefulWidget {
  const CookingScreen({super.key});

  @override
  State<CookingScreen> createState() => _CookingScreenState();
}

class _CookingScreenState extends State<CookingScreen> {
  int? _selectedIndex;

  final List<Map<String, dynamic>> _options = [
    {
      "title": "Meat",
      "subtitle": "Grilled & juicy dishes",
      "icon": "🥩",
      "color": const Color(0xFFE53935),
      "lightColor": const Color(0xFFFFEBEE),
      "recipes": ["Steak", "Grilled Chicken", "Lamb Chops"],
    },
    {
      "title": "Tuna",
      "subtitle": "Light & healthy meals",
      "icon": "🐟",
      "color": const Color(0xFF1976D2),
      "lightColor": const Color(0xFFE3F2FD),
      "recipes": ["Tuna Salad", "Tuna Pasta", "Tuna Sandwich"],
    },
    {
      "title": "Pasta",
      "subtitle": "Creamy & rich flavors",
      "icon": "🍝",
      "color": const Color(0xFFFF8C00),
      "lightColor": const Color(0xFFFFF3E0),
      "recipes": ["Creamy Pasta", "Pesto Pasta", "Tomato Pasta"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F2),
        elevation: 0,
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
        title: const Text(
          "Start Cooking",
          style: TextStyle(
            color: Color(0xFF2D2D2D),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // ======= Header =======
            const Text(
              "What would you like\nto cook today?",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D2D2D),
                height: 1.3,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Choose your main ingredient",
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
            const SizedBox(height: 30),

            // ======= الخيارات =======
            Expanded(
              child: ListView.separated(
                itemCount: _options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final option = _options[index];
                  final bool isSelected = _selectedIndex == index;
                  final Color mainColor = option["color"];
                  final Color lightColor = option["lightColor"];

                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isSelected ? mainColor : Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: isSelected ? mainColor : Colors.grey.shade200,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? mainColor.withOpacity(0.25)
                                : Colors.black.withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Emoji Container
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white.withOpacity(0.2)
                                  : lightColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                option["icon"],
                                style: const TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                          const SizedBox(width: 18),

                          // Text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  option["title"],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: isSelected
                                        ? Colors.white
                                        : const Color(0xFF2D2D2D),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  option["subtitle"],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isSelected
                                        ? Colors.white.withOpacity(0.8)
                                        : Colors.grey[500],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                // Recipe chips
                                Wrap(
                                  spacing: 6,
                                  children: (option["recipes"] as List<String>)
                                      .map(
                                        (r) => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.white.withOpacity(0.2)
                                            : lightColor,
                                        borderRadius:
                                        BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        r,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: isSelected
                                              ? Colors.white
                                              : mainColor,
                                        ),
                                      ),
                                    ),
                                  )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // ======= زر Let's Go =======
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF8C00),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                elevation: 0,
              ),
              child: const Text(
                "Let's Go!",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}