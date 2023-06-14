import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home/home_page_view_model.dart';

showSimpleModalDialog(BuildContext context) {
  final theme = Theme.of(context);
  final viewModel = context.read<HomePageViewModel>();
  final TextEditingController value = TextEditingController();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: 250,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Informe a mesa'),
                    IconButton(
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    controller: value,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Número da mesa',
                      hintStyle: theme.textTheme.bodySmall!.copyWith(
                        color: theme.colorScheme.onBackground.withOpacity(0.5),
                      ),
                    ),
                    maxLength: 8,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: FilledButton(
                    child: const Text('Salvar'),
                    onPressed: () {
                      viewModel.setTableNumber(value.text);
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      });
}
