import 'package:flutter/material.dart';

import '../utils/color_pallete.dart';

class ContainerDecoration extends StatelessWidget {
  const ContainerDecoration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.21,
      decoration: const BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0))),
    );
  }
}
