import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomIconButton extends StatelessWidget {
  const BottomIconButton({
    Key? key,
    required this.gridHeight,
    required this.gridWidth,
    required this.path,
    required this.ontap,
  }) : super(key: key);

  final double? gridHeight;
  final double? gridWidth;
  final String path;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap(),
      child: SizedBox(
        height: gridHeight! * 5,
        width: gridWidth! * 25,
        child: SvgPicture.asset(
          path,
          fit: BoxFit.contain,
          color: Colors.transparent.withOpacity(.7),
        ),
      ),
    );
  }
}
