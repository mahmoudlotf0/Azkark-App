import 'package:auto_size_text/auto_size_text.dart';
import 'package:azkarapp/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:azkarapp/presentation/resources/font_manager.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/constants_manager.dart';
import '../../../resources/values_manager.dart';
import '../sebha_view_model.dart';

class AddSebhaIcon extends StatelessWidget {
  final SebhaViewModel viewModel;
  const AddSebhaIcon({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseServices db = DatabaseServices.getObject;
    return Consumer<SebhaViewModel>(
      builder: (context, provider, _) => IconButton(
        onPressed: () {
          if (provider.isBottomSheetShow) {
          } else {
            viewModel.scaffoldKey.currentState!
                .showBottomSheet(
                  (context) {
                    return _buildContentOfBottomSheet(
                      context: context,
                      provider: provider,
                      db: db,
                    );
                  },
                )
                .closed
                .then((_) {
                  provider.changeButtomSheetState(isShow: false);
                  provider.resetController();
                });
            provider.changeButtomSheetState(isShow: true);
          }
        },
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContentOfBottomSheet({
    required BuildContext context,
    required SebhaViewModel provider,
    required DatabaseServices db,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.p8.h,
        horizontal: AppPadding.p8.w,
      ),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                enableInteractiveSelection: false,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: ColorManager.white,
                      fontSize: FontSize.s16,
                    ),
                controller: provider.controller,
                autofocus: true,
                textAlign: TextAlign.start,
                cursorColor: ColorManager.white,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  hintTextDirection: TextDirection.rtl,
                  fillColor: ColorManager.primary,
                  prefixIcon: Icon(
                    Icons.add,
                    color: ColorManager.white,
                    size: AppSize.s20.r,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      style: BorderStyle.none,
                      width: 0.0,
                    ),
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius),
                  ),
                  hintText: 'إضافة ذكر...',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: ColorManager.white),
                ),
              ),
            ),
            Divider(
              color: ColorManager.grey,
              indent: 40.w,
              endIndent: 40.w,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () async {
                    if (provider.controller.text.isEmpty) {
                      await Fluttertoast.showToast(
                        msg: 'برجاء إضافة ذكر',
                      );
                    } else {
                      db.insertData(title: provider.controller.text, value: 0);
                      provider.resetController();
                      Navigator.of(context).pop();
                      Fluttertoast.showToast(
                        msg: 'تمت إضافة ذكر جديد',
                      );
                    }
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all<Color>(
                        ColorManager.white.withOpacity(0.3)),
                  ),
                  child: AutoSizeText(
                    'إضافة',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: ColorManager.white,
                        ),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all<Color>(
                        ColorManager.white.withOpacity(0.3)),
                  ),
                  onPressed: () {
                    provider.resetController();
                    Navigator.of(context).pop();
                  },
                  child: AutoSizeText(
                    'إلغاء',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: ColorManager.white,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
