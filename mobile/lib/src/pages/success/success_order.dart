import 'package:flutter/material.dart';
import 'package:waiter_app/src/providers/order_context.dart';

import 'package:waiter_app/src/shared/app_colors.dart';

class SuccessOrder extends StatefulWidget {
  const SuccessOrder({super.key});

  @override
  State<SuccessOrder> createState() => _SuccessOrderState();
}

class _SuccessOrderState extends State<SuccessOrder> {
  @override
  Widget build(BuildContext context) {
    final state = OrderState.of(context);
    final products = state.products;

    return Scaffold(
      backgroundColor: AppColors.red,
      body: Center(
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 20,
                color: AppColors.bg_4,
              ),
              Text(
                'Pedido confirmado',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'O pedido já entrou na fila de produção!',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              GestureDetector(
                onTap: () {
                  products.clear();
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  width: 72,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.bg_4,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: Center(
                    child: Text(
                      'OK',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
