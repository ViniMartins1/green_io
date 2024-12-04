import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/config/app_data.dart';
import 'package:green_io/src/model/item.dart';
import 'package:green_io/src/pages/home/components/category_tile.dart';
import 'package:green_io/src/pages/home/components/item_tile.dart';
import 'package:green_io/src/widgets/green_io_field.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> get categories => AppData.categories;
  List<Item> get itemList => AppData.items;
  String _selectedCategory = 'Fruits';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text.rich(
          TextSpan(
            style: TextStyle(fontSize: 30),
            children: [
              TextSpan(text: 'green', style: TextStyle(color: Colors.white)),
              TextSpan(text: '.', style: TextStyle(color: Colors.black)),
              TextSpan(text: 'io', style: TextStyle(color: Colors.amber)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                  backgroundColor: AppColors.contrastColor,
                  label: const Text('2'),
                  // alignment: Alignment.centerRight,
                  child: const Icon(Icons.shopping_cart_rounded)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: GreenIOField(
              label: 'Pesquisar...',
              icon: Icons.search_rounded,
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => CategoryTile(
                category: categories[index],
                isSelected: categories[index] == _selectedCategory,
                onPressed: () {
                  setState(() {
                    _selectedCategory = categories[index];
                  });
                },
              ),
              separatorBuilder: (_, index) => const SizedBox(width: 10),
              itemCount: categories.length,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 9 / 11.5,
              ),
              itemCount: itemList.length,
              itemBuilder: (context, index) => ItemTile(
                item: itemList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
