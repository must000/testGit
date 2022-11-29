import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject2/src/constant/app_colors.dart';
import 'package:providerproject2/src/provider/home_provider.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.colorIsPink, required this.controller })
      : super(key: key);

  final String colorIsPink;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:  () {
        provider.tap(context, colorIsPink);
      },
        onTapDown: (_) => provider.onTapDown(colorIsPink),
      onTapUp: (_) => provider.onTapUp(colorIsPink),
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            color: colorIsPink == 'pink' ? AppColors.pink : AppColors.blue,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
          ),
          height: size.height * 0.1,
          width: size.height * 0.1,
        ),
       CircularProgressIndicator(
          value: controller.value,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
        )
      ]),
    );
  }
}
