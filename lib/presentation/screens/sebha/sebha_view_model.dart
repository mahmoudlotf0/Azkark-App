import 'package:azkarapp/presentation/resources/constants_manager.dart';
import 'package:azkarapp/services/database_services.dart';

import '../../resources/route_manager.dart';
import 'package:flutter/material.dart';

class SebhaViewModel with ChangeNotifier {
  int total = 0;
  bool isBottomSheetShow = false;
  TextEditingController controller = TextEditingController();
  DatabaseServices db = DatabaseServices.getObject;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int currentNumber = 0;

  void onPressedSebhaItem({
    required String title,
    required BuildContext context,
    required int value,
  }) {
    Navigator.of(context).pushNamed(
      Routes.detailsSebha,
      arguments: {
        'title': title,
        'value': value,
      },
    );
  }

  void resetController() {
    controller.clear();
    notifyListeners();
  }

  void changeButtomSheetState({
    required bool isShow,
  }) {
    isBottomSheetShow = isShow;
    notifyListeners();
  }

  Future getTotal() async {
    num totalTemp = 0;
    List<Map> list =
        await db.readData('SELECT * FROM ${AppConstants.tableNameSql}');
    for (var element in list) {
      totalTemp += element['value'];
    }

    total = totalTemp.toInt();
    notifyListeners();
  }

  void increaseCurrentNumber() {
    currentNumber++;
    notifyListeners();
  }

  void resetCurrentNumber() {
    currentNumber = 0;
    notifyListeners();
  }
}
