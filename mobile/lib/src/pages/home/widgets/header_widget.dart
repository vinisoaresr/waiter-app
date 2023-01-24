import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:waiter_app/src/providers/order_context.dart';
import 'package:waiter_app/src/shared/app_colors.dart';
import 'package:waiter_app/src/shared/app_text_styles.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.tableNumber, required this.callback});

  final int tableNumber;
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tableNumber > 0
            ? withOrderHeader(callback, context)
            : defaultHeader(),
      ),
    );
  }

  List<Widget> defaultHeader() {
    return [
      const Text(
        'Bem vindo(a) ao',
        style: AppTextStyles.body2,
      ),
      const Text.rich(
        TextSpan(
          text: 'WAITER',
          style: AppTextStyles.title,
          children: [
            TextSpan(
              text: 'APP',
              style: AppTextStyles.h5,
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> withOrderHeader(Function(int) callback, BuildContext context) {
    return [
      Container(
        height: 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Pedido',
              style: AppTextStyles.h4,
            ),
            GestureDetector(
              onTap: () {
                // delete all order items
                OrderProvider.of(context).products.clear();
                callback(0);
              },
              child: const Text(
                "cancelar pedido",
                style: AppTextStyles.body1,
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
          'Mesa ${tableNumber.toString()}',
          style: AppTextStyles.body2,
        ),
      )
    ];
  }
}
