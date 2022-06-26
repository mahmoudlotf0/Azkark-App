import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../resources/color_manager.dart';
import '../details_zekr_view_model.dart';

class IconCopy extends StatelessWidget {
  final DetailsZekrViewModel viewModel;

  const IconCopy({required this.viewModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Consumer<DetailsZekrViewModel>(
        builder: (context, provider, _) => IconButton(
          icon: Icon(
            Icons.copy,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            SnackBar snackBar = SnackBar(
              content: AutoSizeText(
                viewModel.snakBarTitle,
                style: Theme.of(context).textTheme.headline2,
              ),
              duration: const Duration(seconds: 1),
              backgroundColor: ColorManager.primary,
            );
            Clipboard.setData(
              ClipboardData(
                text: provider.azkar[provider.pageIndex].description,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
