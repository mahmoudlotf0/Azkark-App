import 'package:azkarapp/my_widgets/common_widget/advanced_search.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextFormField(
        readOnly: true,
        onTap: () {
          showSearch(context: context, delegate: AdvancedSearch());
        },
        cursorWidth: 0.5,
        style: Theme.of(context).textTheme.headline1,
        //cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(5.0),
          prefixIcon: Icon(Icons.search,
              size: 20.0, color: Theme.of(context).accentColor),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          // hintText: 'بحث',
          hintText: 'بحث',
          hintStyle: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
