import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:waiter_app/src/models/product.dart';
import 'package:waiter_app/src/providers/order_context.dart';
import 'package:waiter_app/src/shared/app_colors.dart';
import 'package:waiter_app/src/shared/app_text_styles.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final state = OrderProvider.of(context);

    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 33.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final intl = NumberFormat.currency(
              locale: 'pt_BR',
              symbol: 'R\$',
              decimalDigits: 2,
            );

            return Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25.0, right: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 96,
                          width: 120,
                          margin: const EdgeInsets.only(right: 16),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset(
                            'assets/images/${products[index].imagePath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  products[index].name.toString(),
                                  style: AppTextStyles.h6,
                                ),
                                Text(
                                  products[index].description.toString(),
                                  style: AppTextStyles.body2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      intl.format(products[index].price),
                                      style: AppTextStyles.h6,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        state.addProduct(products[index]);
                                      },
                                      child: const Icon(
                                        Icons.add_circle_outline,
                                        color: AppColors.red,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25.0),
                  child: const Divider(
                    color: AppColors.bg_3,
                    height: 1,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
