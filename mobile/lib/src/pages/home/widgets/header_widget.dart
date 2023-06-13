import 'package:flutter/material.dart';
import 'package:waiter_app/src/providers/order_context.dart';
import 'package:waiter_app/src/shared/app_colors.dart';

class Header extends StatelessWidget {
  final int tableNumber;

  const Header({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            tableNumber > 0 ? withOrderHeader(context) : defaultHeader(context),
      ),
    );
  }

  List<Widget> defaultHeader(context) {
    return [
      Text(
        'Bem vindo(a) ao',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      Text.rich(
        TextSpan(
          text: 'WAITER',
          style: Theme.of(context).textTheme.titleMedium,
          children: [
            TextSpan(
              text: 'APP',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> withOrderHeader(BuildContext context) {
    final state = OrderState.of(context);
    final tableValueNotifier = state.tableNumber;

    return [
      SizedBox(
        height: 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pedido',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () {
                OrderState.of(context).getProducts.clear();
                tableValueNotifier.value = 0;
              },
              child: Text(
                "cancelar pedido",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: 54,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
            color: AppColors.white_3,
            border: Border.all(
              color: AppColors.white_1,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Text(
          'Mesa ${tableValueNotifier.value}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      )
    ];
  }
}
