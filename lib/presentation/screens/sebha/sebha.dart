import 'package:auto_size_text/auto_size_text.dart';
import 'package:azkarapp/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/appbar_widget.dart';
import '../../../common_widget/setting_icon.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/values_manager.dart';
import 'components/add_sebha_icon.dart';
import 'sebha_view_model.dart';

class Sebha extends StatelessWidget {
  final SebhaViewModel viewModel;
  const Sebha({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DatabaseServices db = DatabaseServices.getObject;
    return SafeArea(
      child: Scaffold(
        key: viewModel.scaffoldKey,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            Consumer<SebhaViewModel>(
              builder: (context, provider, _) {
                return FutureBuilder(
                  future: db.readData(
                    'SELECT * FROM ${AppConstants.tableNameSql}',
                  ),
                  builder: (context, AsyncSnapshot<List<Map>?> snapShot) {
                    provider.getTotal();
                    if (snapShot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                provider.onPressedSebhaItem(
                                  context: context,
                                  value: snapShot.data![index]['value'],
                                  title: snapShot.data![index]['title'],
                                );
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  _buildContainer(
                                    context: context,
                                    child: _buildContainerContent(
                                      db: db,
                                      snapShot: snapShot,
                                      index: index,
                                      context: context,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: snapShot.data!.length,
                        ),
                      );
                    } else {
                      return CircularProgressIndicator(
                        color: ColorManager.primary,
                      );
                    }
                  },
                );
              },
            ),
            _buildContainer(
              context: context,
              child: Center(
                child: Consumer<SebhaViewModel>(
                  builder: (context, provider, _) {
                    return AutoSizeText(
                      '${'المجموع'}: ${provider.total}',
                      style: Theme.of(context).textTheme.headline3,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerContent({
    required DatabaseServices db,
    required var snapShot,
    required int index,
    required BuildContext context,
  }) {
    return Row(
      children: [
        DeleteIconButton(
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTextButton(
                  onPressed: () async {
                    await db.deleteData(
                      title: snapShot.data![index]['title'],
                    );
                    Fluttertoast.showToast(
                      msg: 'تم حذف الذكر',
                    );
                    Navigator.of(context).pop();
                  },
                  title: 'نعم',
                  context: context,
                ),
                _buildTextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  title: 'لا',
                  context: context,
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText(
                snapShot.data![index]['title'],
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 10.h),
              AutoSizeText(
                '${'عدد التسبيح'}: ${snapShot.data![index]['value']}',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: ColorManager.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextButton({
    required Function() onPressed,
    required String title,
    required BuildContext context,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: AutoSizeText(
        title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: ColorManager.primary,
            ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return appBarWidget(
      title: 'السبحة',
      actions: [
        AddSebhaIcon(viewModel: viewModel),
        const SettingsIcon(),
      ],
    );
  }

  Widget _buildContainer(
      {required BuildContext context, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: AppMargin.m10.h,
        horizontal: AppMargin.m15.w,
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.p10.h,
        horizontal: AppPadding.p10.w,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
        borderRadius: BorderRadius.circular(
          AppConstants.borderRadius,
        ),
      ),
      child: child,
    );
  }
}

class DeleteIconButton extends StatelessWidget {
  final List<Widget> actions;
  const DeleteIconButton({
    required this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Theme.of(context).hintColor,
              content: AutoSizeText(
                "هل تريد حذف الذكر؟",
                style: Theme.of(context).textTheme.headline1,
              ),
              actions: actions,
            );
          },
        );
      },
      icon: const Icon(
        Icons.delete,
        size: AppSize.s30,
      ),
    );
  }
}
