import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logacatch/main.dart';
import 'package:logacatch/models/authentication_handler.dart';
import 'package:logacatch/view/widgets/background_screen.dart';
import 'package:provider/provider.dart';

import '../screen_config.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  double? gridHeight, gridWidth;
  Timer? t;
  @override
  void initState() {
    // userDetails(context);
    t = Timer.periodic(const Duration(seconds: 5), (timer) {
      t!.cancel();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LogInPage()));
    });

    super.initState();
  }

  userDetails(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String jwt = await user.getIdToken();
      Provider.of<Auth>(context, listen: false)
          .store(user.uid, jwt, user.displayName, user.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    // userDetails(context);
    ScreenConfig().read(context);
    gridHeight = ScreenConfig.gridHeight;
    gridWidth = ScreenConfig.gridWidth;
    return Background(
        foregroundWidget: SizedBox(
      height: gridHeight! * 100,
      width: gridWidth! * 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: gridHeight! * 28,
          ),
          SizedBox(
            height: gridHeight! * 28,
            width: gridWidth! * 60,
            child: Image.asset(
              "assets/appLogo.png",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: gridHeight! * 12,
          ),
          const CircularProgressIndicator(
            color: Color(0xFF1C393D),
          )
        ],
      ),
    ));
  }
}
