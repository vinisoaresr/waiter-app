import 'package:flutter/material.dart';
import 'package:waiter_app/src/widgets/button.dart';

showSimpleModalDialog(BuildContext context, Function(int) callback) {
  final TextEditingController value = TextEditingController();

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            height: 250,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 32, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Informe a mesa'),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 44.5),
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(24.0),
                  // ),
                  child: TextField(
                    controller: value,
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Número da mesa',
                    ),
                    showCursor: false,
                    maxLength: 99,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24.0),
                  child: Button(
                    text: 'Salvar',
                    callback: () {
                      callback(int.parse(value.text));
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      });
}
