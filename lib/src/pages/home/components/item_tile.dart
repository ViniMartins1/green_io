import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/model/item.dart';
import 'package:green_io/src/pages/product/product_detail_page.dart';
import 'package:green_io/src/services/util_services.dart';

class ItemTile extends StatefulWidget {
  final Item item;
  const ItemTile({super.key, required this.item});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  IconData tileIcon = Icons.add_shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => tileIcon = Icons.check_rounded);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => tileIcon = Icons.add_shopping_cart_rounded);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: Card(
            elevation: 1,
            shadowColor: const Color.fromRGBO(224, 224, 224, 1),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(widget.item.imgUrl),
                  ),
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        UtilsServices.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.appSwatchColor,
                        ),
                      ),
                      Text(
                        '/${widget.item.unit}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: widget.item),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Material(
              child: InkWell(
                onTap: () async {
                  await switchIcon();
                },
                child: Ink(
                  decoration: BoxDecoration(
                    color: AppColors.appSwatchColor,
                  ),
                  height: 40,
                  width: 35,
                  child: Icon(
                    tileIcon,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
