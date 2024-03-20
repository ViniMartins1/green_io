import 'package:flutter/material.dart';
import 'package:green_io/src/config/app_colors.dart';
import 'package:green_io/src/model/item.dart';
import 'package:green_io/src/widgets/green_io_buttons.dart';
import 'package:green_io/src/services/util_services.dart';
import 'package:green_io/src/widgets/quantity_select.dart';
import 'package:green_io/src/widgets/return_button.dart';

class ProductDetailPage extends StatefulWidget {
  final Item product;
  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Image.asset(widget.product.imgUrl),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(44),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 2),
                        color: Color.fromRGBO(117, 117, 117, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.product.name,
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          QuantitySelect(
                            value: _quantity,
                            sufixText: widget.product.unit,
                            result: (amount) {
                              setState(() {
                                _quantity = amount;
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        UtilsServices.priceToCurrency(widget.product.price),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColors.appSwatchColor,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.product.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                      ),
                      GreenIOButton(
                        label: 'Add to cart',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const ReturnButton(color: Colors.black),
        ],
      ),
    );
  }
}
