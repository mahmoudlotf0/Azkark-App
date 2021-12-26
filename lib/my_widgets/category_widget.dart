import 'package:flutter/material.dart';
import '../Screens/page_view_screen.dart';

class CategoryWidget extends StatefulWidget {
  final String? title;
  final String? id;
  final String? number;
  final int? numberInCircle;
  CategoryWidget({
    this.numberInCircle,
    this.title,
    this.id,
    this.number,
  });
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  // this is root widget
  @override
  Widget build(BuildContext context) {
    void _selectedCategory(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        PageViewScreen.routeName,
        arguments: {
          'id': widget.id,
          'title': widget.title,
          'number': widget.number,
          'nic': widget.numberInCircle,
        },
      );
    }

    return GestureDetector(
      onTap: () => _selectedCategory(context),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        child: Container(
          child: Center(
            child: Text(
              widget.title!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
