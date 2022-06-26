import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:azkarapp/presentation/resources/assets_manager.dart';
import 'package:azkarapp/presentation/resources/color_manager.dart';
import 'package:azkarapp/providers/share_provider.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShareProvider>(
      builder: (context, provider, _) => BottomNavigationBar(
        selectedLabelStyle: Theme.of(context).textTheme.headline2!,
        unselectedLabelStyle: Theme.of(context).textTheme.bodyText1!,
        currentIndex: provider.currentIndexBottomBar,
        onTap: (currentIndex) {
          provider.onPressedBottomBar(currentIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(
              image: ImageAssets.homeOutline,
              context: context,
              color: Theme.of(context).dividerColor,
            ),
            label: 'الرئيسية',
            activeIcon: _buildIcon(
              image: ImageAssets.homeFill,
              context: context,
              color: ColorManager.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                image: ImageAssets.azkarOutLine,
                context: context,
                color: Theme.of(context).dividerColor),
            label: 'الأذكار',
            activeIcon: _buildIcon(
              image: ImageAssets.azkarFill,
              context: context,
              color: ColorManager.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
                image: ImageAssets.sebhaOutline,
                context: context,
                color: Theme.of(context).dividerColor),
            label: 'السبحة',
            activeIcon: _buildIcon(
              image: ImageAssets.sebhaFill,
              context: context,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon({
    required String image,
    required BuildContext context,
    required Color color,
  }) =>
      Image.asset(
        image,
        fit: BoxFit.cover,
        width: 22.w,
        height: 22.h,
        color: color,
      );
}
