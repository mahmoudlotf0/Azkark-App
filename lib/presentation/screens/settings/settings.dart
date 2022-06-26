import 'dart:math' as math;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:azkarapp/common_widget/appbar_widget.dart';
import 'package:azkarapp/presentation/resources/color_manager.dart';
import 'package:azkarapp/presentation/resources/values_manager.dart';
import 'package:azkarapp/presentation/screens/settings/settings_view_model.dart';
import 'package:azkarapp/providers/share_provider.dart';

class Settings extends StatelessWidget {
  final SettingViewModel viewModel;
  const Settings({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: viewModel.appBarTitle),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p10.w,
            vertical: AppPadding.p10.h,
          ),
          child: Column(
            children: [
              Consumer<ShareProvider>(
                builder: (_, provider, __) => ListTile(
                  title: AutoSizeText(
                    viewModel.darkModetitle,
                    style: Theme.of(context).textTheme.headline1,
                    textDirection: TextDirection.rtl,
                  ),
                  leading: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Switch(
                      value: provider.isDark,
                      onChanged: (bool value) {
                        provider.onChangeSwitch(value);
                      },
                      activeColor: ColorManager.primary,
                    ),
                  ),
                ),
              ),
              const Divider(thickness: 0.4),
            ],
          ),
        ),
      ),
    );
  }
}
