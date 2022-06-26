import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main_data.dart';
import '../../../models/categories.dart';
import '../../../models/zekr.dart';

class DetailsZekrViewModel with ChangeNotifier {
  String snakBarTitle = 'تم نسخ الذكر';
  late Category category;
  PageController pageController = PageController();
  int pageIndex = 0;
  int start = 0;
  List<Zekr> azkar = [];

  double progress = 0.0;
  static DetailsZekrViewModel getObject(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<DetailsZekrViewModel>(context, listen: listen);
  }

  void getZekr() {
    azkar = azkarData.where(
      (Zekr zekr) {
        return zekr.categories.contains(category.id);
      },
    ).toList();
    notifyListeners();
  }

  void onPressedZekr(Zekr zekr) {
    if (start == zekr.numberInCircule - 1 && pageIndex + 1 < azkar.length) {
      increamentStart(zekr);
      Future.delayed(const Duration(milliseconds: 300), () {
        goNextPageIndex(zekr);
      });
    } else if (progress < 1.0 && start < zekr.numberInCircule) {
      increamentStart(zekr);
    }
  }

  Future<void> goNextPageIndex(Zekr zekr) async {
    await pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void increamentStart(Zekr zekr) {
    ++start;
    progress = progress + (1 / zekr.numberInCircule);
    notifyListeners();
  }

  void onPageChange(int currentIndex) {
    Future.delayed(const Duration(milliseconds: 200), () {
      pageIndex = currentIndex;
      restCircleIndicator();
    });
    notifyListeners();
  }

  void navigatorPop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void resetPageIndex() async {
    pageIndex = 0;
    notifyListeners();
  }

  void restCircleIndicator() {
    start = 0;
    progress = 0;
    notifyListeners();
  }

  void restVariables() {
    restCircleIndicator();
    resetPageIndex();
  }

  void onPressedLeadingIcon(BuildContext context) {
    restVariables();
    navigatorPop(context);
  }

  Future hideKeyboard() async {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
