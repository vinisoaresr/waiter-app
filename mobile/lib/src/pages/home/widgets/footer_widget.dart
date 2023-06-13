import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../providers/order_context.dart';
import '../../../shared/app_colors.dart';
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
      width: double.infinity,
      height: 96,
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 24),
      child: FilledButton(
        onPressed: () {
          showSimpleModalDialog(context);
        },
        child: const Text('Novo Pedido'),
      ),
    );
  }

  Widget withOrderFooter(BuildContext context) {
    final state = OrderState.of(context);
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
                              style: Theme.of(context).textTheme.bodyMedium,
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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    intl.format(state.getProducts[index].price),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
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
                              child: Icon(
                                Icons.add_circle_outline,
                                color: Theme.of(context).primaryColor,
                                size: 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                state.removeProduct(state.getProducts[index]);
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                color: Theme.of(context).primaryColor,
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
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 16),
                  child: FilledButton(
                    child: const Text('Confirmar pedido'),
                    onPressed: () {
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
            child: Text(
              'Seu carrinho \n está vazio',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 50),
            child: FilledButton(
              // disabled: true,
              child: const Text('Confirmar pedido'),
              onPressed: () {
                showSimpleModalDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
