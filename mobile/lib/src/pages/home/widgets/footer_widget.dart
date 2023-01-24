import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:waiter_app/src/providers/order_context.dart';
import 'package:waiter_app/src/shared/app_colors.dart';
import 'package:waiter_app/src/shared/app_text_styles.dart';
import 'package:waiter_app/src/widgets/button.dart';
import 'package:waiter_app/src/widgets/confirm_modal_widget.dart';

enum FooterType { waiting, withoutOrder, withOrder }

class Footer extends StatelessWidget {
  const Footer({super.key, required this.callback, required this.type});

  final Function(int value) callback;
  final FooterType type;

  @override
  Widget build(BuildContext context) {
    return type == FooterType.waiting
        ? waitingFooter(context, callback)
        : type == FooterType.withOrder
            ? withOrderFooter(context, callback)
            : withoutOrderFooter(context, callback);
  }

  Widget waitingFooter(BuildContext context, Function(int value) callback) {
    return Container(
      height: 76,
      margin: const EdgeInsets.only(bottom: 24),
      child: Container(
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 24),
        child: Button(
          text: 'Novo Pedido',
          callback: () {
            showSimpleModalDialog(context, callback);
          },
        ),
      ),
    );
  }

  Widget withOrderFooter(BuildContext context, Function(int value) callback) {
    final intl = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    double total = 0;
    OrderProvider.of(context).products.forEach((element) {
      total += element.price;
    });
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
              itemCount: OrderProvider.of(context).products.length,
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
                                'assets/images/${OrderProvider.of(context).products[index].imagePath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              '${OrderProvider.of(context).products[index].quantity.toString()}x',
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
                                    OrderProvider.of(context)
                                        .products[index]
                                        .name
                                        .toString(),
                                    style: AppTextStyles.body2,
                                  ),
                                  Text(
                                    intl.format(OrderProvider.of(context)
                                        .products[index]
                                        .price),
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
                                OrderProvider.of(context).state.addProduct(
                                    OrderProvider.of(context).products[index]);
                              },
                              child: const Icon(
                                Icons.add_circle_outline,
                                color: AppColors.red,
                                size: 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                OrderProvider.of(context).state.removeProduct(
                                    OrderProvider.of(context).products[index]);
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

  Widget withoutOrderFooter(
      BuildContext context, Function(int value) callback) {
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
                showSimpleModalDialog(context, callback);
              },
            ),
          ),
        ],
      ),
    );
  }
}
