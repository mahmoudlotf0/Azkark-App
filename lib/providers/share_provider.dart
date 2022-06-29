import 'package:azkarapp/presentation/screens/sebha/sebha_view_model.dart';
import 'package:flutter/material.dart';

import 'package:azkarapp/presentation/screens/Azkar/azkar.dart';
import 'package:azkarapp/presentation/screens/Azkar/azkar_view_model.dart';
import 'package:azkarapp/presentation/screens/home/home.dart';
import 'package:azkarapp/presentation/screens/sebha/sebha.dart';
import 'package:azkarapp/services/shared_prefs.dart';

class ShareProvider with ChangeNotifier {
  //! Bottom Navigation Bar
  int currentIndexBottomBar = 1;
  List<Widget> screens = [
    const Home(),
    Azkar(viewModel: AzkarViewModel()),
    Sebha(viewModel: SebhaViewModel()),
  ];
  void onPressedBottomBar(int currentIndex) {
    currentIndexBottomBar = currentIndex;
    notifyListeners();
  }

  //! Switch DarkMode
  bool isDark = false;
  void onChangeSwitch(bool currentValue) {
    isDark = currentValue;
    saveIsDark();
    notifyListeners();
  }

  void saveIsDark() {
    SharedPrefs.saveDatabool(isDark);
  }

  getIsDark() async {
    isDark = (await SharedPrefs.getDataBool('isDark')) ?? false;
    notifyListeners();
  }
}
