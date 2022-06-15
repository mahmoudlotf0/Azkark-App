import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manager.dart';

import '../details_view_model.dart';

class IconCopy extends StatelessWidget {
  final DetailsViewModel viewModel;

  const IconCopy({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: IconButton(
        icon: const Icon(Icons.copy),
        onPressed: () {
          SnackBar snackBar = SnackBar(
            content: AutoSizeText(
              viewModel.snakBarTitle,
              style: getBoldStyle(
                color: ColorManager.white,
                fontsize: FontSize.s18,
              ),
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: ColorManager.darkRed,
          );
          Clipboard.setData(
            ClipboardData(
              text: viewModel.getZekr()[viewModel.pageIndex].description,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
