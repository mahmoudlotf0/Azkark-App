import 'package:flutter/material.dart';

import '../details_view_model.dart';
import 'circle_percent.dart';
import 'icon_copy.dart';
import 'number_of_iteration.dart';

class FooterWidget extends StatelessWidget {
  final DetailsViewModel viewModel;
  const FooterWidget({required this.viewModel, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: [
          IconCopy(viewModel: viewModel),
          CirclePercent(viewModel: viewModel),
          NumberOfIteration(viewModel: viewModel),
        ],
      ),
    );
  }
}
