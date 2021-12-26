import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../my_widgets/category_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // this is root of widget
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 3 / 2,
              padding: const EdgeInsets.all(25),
              children: DUMMY_CATEGORY.map(
                (catId) {
                  return CategoryWidget(
                    title: catId.title,
                    id: catId.id,
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
