import 'package:flutter/material.dart';

import '../utils/color_pallete.dart';
class ContainerWhite extends StatelessWidget {
  final double? height;
  final Widget child;
  const ContainerWhite({

    Key? key,  this.height, required this.child,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0, // soften the shadow
            spreadRadius: 1.0, //extend the shadow
          )
        ],
      ),
      child: child,
    );
  }
}
