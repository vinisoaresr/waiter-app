import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/app_colors.dart';
import '../home_page_view_model.dart';

class Header extends StatelessWidget {
  final int tableNumber;

  const Header({super.key, required this.tableNumber});

  @override
  Widget build(BuildContext context) {
    final hasTable = tableNumber > 0;

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: hasTable ? withOrderHeader(context) : defaultHeader(context),
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
          children: [
            TextSpan(
              text: 'WAITER',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextSpan(
              text: 'APP',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> withOrderHeader(BuildContext context) {
    final viewModel = context.watch<HomePageViewModel>();
    final tableValueNotifier = viewModel.tableNumber;
    final theme = Theme.of(context);

    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pedido',
            style: theme.textTheme.titleLarge,
          ),
          TextButton(
            onPressed: () {
              viewModel.cancelOrder();
            },
            child: Text(
              "cancelar pedido",
              style: theme.textTheme.titleSmall!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      InkWell(
        onTap: () {
          viewModel.showModalInfoTable();
        },
        child: Container(
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
            style: theme.textTheme.bodyMedium,
          ),
        ),
      )
    ];
  }
}
