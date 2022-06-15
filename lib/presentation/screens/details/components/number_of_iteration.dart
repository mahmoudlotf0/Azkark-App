import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/style_manager.dart';
import '../details_view_model.dart';

class NumberOfIteration extends StatelessWidget {
  const NumberOfIteration({Key? key, required this.viewModel})
      : super(key: key);

  final DetailsViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    DetailsViewModel detailsProvider = DetailsViewModel.getObject(context);
    return Expanded(
      flex: 1,
      child: AutoSizeText(
        detailsProvider.getZekr()[detailsProvider.pageIndex].number,
        style: getBoldStyle(color: ColorManager.black, fontsize: FontSize.s18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
