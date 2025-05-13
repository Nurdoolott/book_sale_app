import 'package:flutter/material.dart';

class CategoryChooserWidget extends StatefulWidget {
  const CategoryChooserWidget({super.key});

  @override
  State<CategoryChooserWidget> createState() => _CategoryChooserWidgetState();
}

class _CategoryChooserWidgetState extends State<CategoryChooserWidget> {
  final List<String> categories = ['All', 'Fiction', 'Science', 'History'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return ChoiceChip(
            label: Text(categories[index]),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
