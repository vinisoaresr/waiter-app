import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../providers/order_context.dart';
import '../../../shared/app_colors.dart';
import '../../../shared/app_text_styles.dart';
import '../../../widgets/button.dart';
import '../../../widgets/confirm_modal_widget.dart';

enum FooterType { waiting, withoutOrder, withOrder }

class Footer extends StatelessWidget {
  final FooterType currentFooter;
  const Footer({super.key, required this.currentFooter});

  @override
  Widget build(BuildContext context) {
    return currentFooter == FooterType.waiting
        ? waitingFooter(context)
        : currentFooter == FooterType.withOrder
            ? withOrderFooter(context)
            : withoutOrderFooter(context);
  }

  Widget waitingFooter(BuildContext context) {
    return Container(
      height: 76,
      margin: const EdgeInsets.only(bottom: 24),
      child: Container(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
        child: Button(
          text: 'Novo Pedido',
          callback: () {
            showSimpleModalDialog(context);
          },
        ),
      ),
    );
  }

  Widget withOrderFooter(BuildContext context) {
    final state = OrderProvider.of(context);
    final products = state.getProducts;
    final total = products.fold<double>(
        0, (previousValue, element) => previousValue + element.price);
    final intl = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    return Container(
      height: 176,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: AppColors.white_3,
      child: Column(
        children: [
          SizedBox(
            height: 62,
            child: ListView.builder(
              itemCount: state.getProducts.length,
              itemBuilder: ((context, index) {
                return Container(
                  height: 62,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              width: 48,
                              margin: const EdgeInsets.only(right: 16),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.asset(
                                'assets/images/${state.getProducts[index].imagePath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              '${state.getProducts[index].quantity.toString()}x',
                              style: AppTextStyles.body2,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.getProducts[index].name.toString(),
                                    style: AppTextStyles.body2,
                                  ),
                                  Text(
                                    intl.format(state.getProducts[index].price),
                                    style: AppTextStyles.h6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                state.addProduct(state.getProducts[index]);
                              },
                              child: const Icon(
                                Icons.add_circle_outline,
                                color: AppColors.red,
                                size: 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                state.removeProduct(state.getProducts[index]);
                              },
                              child: const Icon(
                                Icons.remove_circle_outline,
                                color: AppColors.red,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total"),
                      Text(
                        intl.format(total),
                        style: AppTextStyles.h6,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 16),
                  child: Button(
                    text: 'Confirmar pedido',
                    callback: () {
                      Navigator.of(context).pushNamed('/success');
                      // show confirm splash screen, send order and reset all states
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget withoutOrderFooter(BuildContext context) {
    return Container(
      height: 114,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      color: AppColors.white_3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 50),
            child: const Text(
              'Seu carrinho \n está vazio',
              textAlign: TextAlign.justify,
              style: AppTextStyles.body2,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 50),
            child: Button(
              disabled: true,
              text: 'Confirmar pedido',
              callback: () {
                showSimpleModalDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
