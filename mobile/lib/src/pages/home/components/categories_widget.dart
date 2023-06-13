import 'package:flutter/material.dart';
import 'package:waiter_app/src/models/category.dart';
import 'package:waiter_app/src/models/mock.dart';
import 'package:waiter_app/src/shared/app_colors.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({
    super.key,
    required this.categories,
  });

  final List<Category> categories;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  String? _selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      height: 74,
      width: double.infinity,
      child: ListView.builder(
        itemCount: widget.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 74,
            width: 80,
            padding:
                index == 0 ? const EdgeInsets.only(left: 24) : EdgeInsets.zero,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategory = widget.categories[index].id;
                });
              },
              child: Opacity(
                opacity:
                    _selectedCategory == widget.categories[index].id ? 1 : 0.4,
                child: Column(
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: AppColors.white_3,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.bg_1.withOpacity(0.1),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          Mock.categories[index].icon,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        Mock.categories[index].name,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
