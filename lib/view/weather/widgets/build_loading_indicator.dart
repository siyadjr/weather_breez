import 'package:flutter/material.dart';
import 'package:weatherbreez/core/reusablewidgets/loading_indicator.dart';

class BuildLoadingIndicator extends StatelessWidget {
  const BuildLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
          height: size.width / 2,
          child: const Center(child: LoadingIndicator())),
    );
  }
}
