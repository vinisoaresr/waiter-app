import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waiter_app/src/pages/home/home_page_view_model.dart';

class SuccessOrder extends StatefulWidget {
  const SuccessOrder({super.key});

  @override
  State<SuccessOrder> createState() => _SuccessOrderState();
}

class _SuccessOrderState extends State<SuccessOrder> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomePageViewModel>();
    final products = viewModel.getProducts;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 20,
                color: Theme.of(context).colorScheme.surfaceTint,
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
                    color: Theme.of(context).colorScheme.surfaceTint,
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
