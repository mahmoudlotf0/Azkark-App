import 'package:azkarapp/presentation/screens/sebha/sebha_view_model.dart';
import 'package:azkarapp/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:azkarapp/presentation/resources/color_manager.dart';
import 'package:azkarapp/presentation/resources/font_manager.dart';

import '../../../common_widget/appbar_widget.dart';

// ignore: must_be_immutable
class DetailsSebha extends StatelessWidget {
  final String title;
  int value;
  DetailsSebha({required this.value, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseServices db = DatabaseServices.getObject;
    return Consumer<SebhaViewModel>(
      builder: (context, provider, _) {
        return GestureDetector(
          onTap: () async {
            provider.increaseCurrentNumber();
            ++value;
            await db.updateData('''
                UPDATE azkar SET 'value' = $value
                WHERE title = '$title'
                          ''');
          },
          child: Scaffold(
            appBar: appBarWidget(title: title),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  Text(
                    'العدد الكلي: $value',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 150.h),
                  Text(
                    provider.currentNumber.toString(),
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontFamily: FontConstants.fontFamiltyDigital,
                          fontSize: 150,
                        ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                provider.resetCurrentNumber();
              },
              child: const Icon(Icons.restart_alt_rounded),
              backgroundColor: ColorManager.primary,
            ),
          ),
        );
      },
    );
  }
}
