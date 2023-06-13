import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:waiter_app/src/models/product.dart';
import 'package:waiter_app/src/providers/order_context.dart';
import 'package:waiter_app/src/shared/app_colors.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final state = OrderState.of(context);

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
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  products[index].description.toString(),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      intl.format(products[index].price),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        state.addProduct(products[index]);
                                      },
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        color: Theme.of(context).primaryColor,
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
