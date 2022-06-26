import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../details_zekr_view_model.dart';

class NumberOfIteration extends StatelessWidget {
  const NumberOfIteration({Key? key, required this.viewModel})
      : super(key: key);

  final DetailsZekrViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Consumer<DetailsZekrViewModel>(
        builder: (_, provider, __) => AutoSizeText(
          provider.azkar[provider.pageIndex].number,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
