import 'package:flutter/material.dart';
import 'package:waiter_app/src/providers/order_context.dart';

import 'package:waiter_app/src/shared/app_colors.dart';
import 'package:waiter_app/src/shared/app_text_styles.dart';

class SuccessOrder extends StatefulWidget {
  const SuccessOrder({super.key});

  @override
  State<SuccessOrder> createState() => _SuccessOrderState();
}

class _SuccessOrderState extends State<SuccessOrder> {
  @override
  Widget build(BuildContext context) {
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
              const Text(
                'Pedido confirmado',
                style: AppTextStyles.h4,
              ),
              const Text(
                'O pedido já entrou na fila de produção!',
                style: AppTextStyles.body3,
              ),
              GestureDetector(
                onTap: () {
                  // call endpoint /order to send order, method post with body {order: products} and return a json with order id
                  // then() =>,,,
                  OrderProvider.of(context).products.clear();
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  width: 72,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColors.bg_4,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: const Center(
                    child: Text(
                      'OK',
                      style: AppTextStyles.body1,
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
