import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main_data.dart';
import '../../../models/categories.dart';
import '../../../models/zekrtype.dart';

class DetailsViewModel with ChangeNotifier {
  String snakBarTitle = 'تم نسخ الذكر';
  late Category category;
  PageController pageController = PageController();
  int pageIndex = 0;
  int start = 0;
  double progress = 0.0;
  static DetailsViewModel getObject(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<DetailsViewModel>(context, listen: listen);
  }

  List<Zekr> getZekr() {
    return azkar.where(
      (Zekr zekr) {
        return zekr.categories.contains(category.id);
      },
    ).toList();
  }

  void onPressedZekr(Zekr zekr) {
    if (start == zekr.numberInCircule - 1 && pageIndex + 1 < getZekr().length) {
      increamentStart(zekr);
      Future.delayed(const Duration(milliseconds: 100), () {
        goNextPageIndex(zekr);
      });
    } else if (progress < 1.0) {
      increamentStart(zekr);
    }
  }

  void goNextPageIndex(Zekr zekr) {
    pageController.jumpToPage(++pageIndex);
  }

  void increamentStart(Zekr zekr) {
    ++start;
    progress = progress + (1 / zekr.numberInCircule);
    notifyListeners();
  }

  void onPageChange(int currentIndex) {
    pageIndex = currentIndex;
    start = 0;
    progress = 0;
    notifyListeners();
  }

  resetPageIndx(BuildContext context) async {
    pageIndex = 0;
    navigatorPop(context);
  }

  void navigatorPop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void restCircleStart(BuildContext context) {
    start = 0;
  }

  Future<bool> onWillPop(BuildContext context) async {
    restCircleStart(context);
    return resetPageIndx(context);
  }
}
