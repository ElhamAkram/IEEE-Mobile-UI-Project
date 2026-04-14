import 'package:flutter/material.dart';
import 'package:ieee_mobile_ui_project/screens/itemsdetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomepageState();
}

class _HomepageState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: " "),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: " ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: " ",
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          border: InputBorder.none,
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.menu, size: 40),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   _categoryItem(Icons.free_breakfast_outlined, 'Breakfast'),
                    _categoryItem(Icons.lunch_dining_outlined, 'Lunch'),
                    _categoryItem(Icons.apple_outlined, 'Dinner'),
                  ],
                ),
                SizedBox(height: 20),

                Text(
                  "Recomended",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),

                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.65,
                  children: [
                    _productCard(
                      "https://i.pinimg.com/736x/39/91/2e/39912e84247cdc403ecf21768535c943.jpg",
                      "Creemy pasta",
                      "30m",
                    ),
                    _productCard(
                      "https://i.pinimg.com/1200x/8e/d5/73/8ed573c25d2fc02eb55454c0c58f0020.jpg",
                      "Tuna Salad",
                      "22m",
                    ),
                    _productCard(
                      "https://i.pinimg.com/736x/1d/84/44/1d84446b4d721830483d22d46cae61c8.jpg",
                      "Burger",
                      "45m",
                    ),
                    _productCard(
                      "https://i.pinimg.com/736x/ab/4d/75/ab4d75bd0c119e896189af19f29a5d7c.jpg",
                      "Stake",
                      "40m",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 40),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }

  Widget _productCard(String image, String title, String time) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ItemDetails(
              data: {"Image": image, "title": title, "time": time},
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                image,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text(time, style: TextStyle(color: const Color.fromARGB(255, 222, 138, 11))),
            ],
          ),
        ),
      ),
    );
  }
}