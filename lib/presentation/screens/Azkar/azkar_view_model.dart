import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../details_zekr/details_zekr_view_model.dart';

import '../../../main_data.dart';
import '../../../models/categories.dart';
import '../../resources/route_manager.dart';

class AzkarViewModel with ChangeNotifier {
  final String titleAppBar = 'الأذكار';
  late Category category;
  final String hintInSearchBar = '...ابحث عن ذكر';
  List<Category> searchedForCategory = categoriesData;
  bool isSearch = false;
  TextEditingController controller = TextEditingController();

  void onPressedCategory(BuildContext context) {
    Provider.of<DetailsZekrViewModel>(context, listen: false).restVariables();
    Provider.of<DetailsZekrViewModel>(context, listen: false).getZekr();

    Navigator.of(context).pushNamed(
      Routes.detailsZekrScreen,
      arguments: category,
    );
  }

  void onChangeSearch(String value) {
    searchedForCategory = categoriesData
        .where((category) => category.title.contains(value))
        .toList();
    notifyListeners();
  }

  void changeIsSearch(bool value) {
    isSearch = value;
    notifyListeners();
  }

  void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void deleteSearchText() {
    searchedForCategory = categoriesData;
    controller.clear();
    changeIsSearch(false);
    notifyListeners();
    hideKeyboard();
  }

  // void hideKeyboard() {
  //   FocusManager.instance.primaryFocus?.unfocus();
  // }
}
