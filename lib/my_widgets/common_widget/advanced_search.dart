import 'package:azkarapp/dummy_data.dart';
import 'package:azkarapp/theme/my_theme.dart';
import 'package:azkarapp/theme/theme_services.dart';
import 'package:flutter/material.dart';
import '../category_widget.dart';

class AdvancedSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // appbar action
    try {
      return <Widget>[
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear, color: Theme.of(context).iconTheme.color),
        ),
      ];
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  String get searchFieldLabel => 'ابحث عن ذكر ';

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeServices().loadThemeFromBox()
        ? MyTheme.darkTheme.copyWith(
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: Theme.of(context).textTheme.headline1,
              filled: true,
              fillColor: Colors.grey[700],
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            textTheme: TextTheme(
              headline1: Theme.of(context).textTheme.headline1,
              subtitle1: Theme.of(context).textTheme.subtitle1,
            ),
          )
        : MyTheme.lightTheme.copyWith(
            inputDecorationTheme: InputDecorationTheme(
              hintStyle: Theme.of(context).textTheme.headline1,
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.none,
                  width: 0.0,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            textTheme: TextTheme(
              subtitle1: Theme.of(context).textTheme.subtitle1,
              headline1: Theme.of(context).textTheme.headline1,
            ),
          );
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon Leading
    try {
      return IconButton(
        onPressed: () {
          // DUMMY_CATEGORY
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    //Search Result
    try {
      return ListView(
        children: DUMMY_CATEGORY.map(
          (e) {
            return e.title.contains(query)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      child: CategoryWidget(
                        title: e.title,
                        id: e.id,
                      ),
                    ),
                  )
                : Container();
          },
        ).toList(),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    try {
      return ListView(
        children: DUMMY_CATEGORY.map(
          (e) {
            return e.title.contains(query)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      child: CategoryWidget(
                        title: e.title,
                        id: e.id,
                      ),
                    ),
                  )
                : Container();
          },
        ).toList(),
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }
}

/*
 ListView(
        children: DUMMY_CATEGORY.map(
          (e) {
            return e.title.contains(query)
                ? GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3 / 2,
                    padding: EdgeInsets.all(25),
                    children: [
                      CategoryWidget(
                        title: e.title,
                        id: e.id,
                      ),
                    ],
                  )
                : Container();
          },
        ).toList(),
      );
 */