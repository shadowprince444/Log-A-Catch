import 'package:flutter/material.dart';
import 'package:logacatch/view/screen_config.dart';

class Background extends StatefulWidget {
  const Background({Key? key, required this.foregroundWidget})
      : super(key: key);
  final Widget foregroundWidget;

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  double? gridHeight, gridWidth;
  @override
  Widget build(BuildContext context) {
    ScreenConfig().read(context);
    gridHeight = ScreenConfig.gridHeight;
    gridWidth = ScreenConfig.gridWidth;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: gridHeight! * 100,
          width: gridWidth! * 100,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/bg.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(child: widget.foregroundWidget),
        ),
      ),
    );
  }
}
