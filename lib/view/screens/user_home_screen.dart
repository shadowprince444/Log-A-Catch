import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logacatch/main.dart';
import 'package:logacatch/view/widgets/background_screen.dart';
import 'package:logacatch/view/widgets/bottom_icon_button.dart';

import '../screen_config.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  double? gridHeight, gridWidth;
  @override
  Widget build(BuildContext context) {
    ScreenConfig().read(context);
    gridHeight = ScreenConfig.gridHeight;
    gridWidth = ScreenConfig.gridWidth;

    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Background(
        foregroundWidget: SizedBox(
          height: gridHeight! * 100,
          width: gridWidth! * 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: gridHeight! * 25,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        tooltip: "Log Out",
                        icon: const Icon(
                          Icons.logout,
                          color: Color(0xFF1C393D),
                        ),
                        iconSize: gridHeight! * 5,
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut().then((value) =>
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LogInPage())));
                        },
                        // child: const Text("Log Out")),
                      ),
                    ]),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: gridWidth! * 15),
                // color: Colors.grey,
                child: Column(
                  children: [
                    containerTile("Log a Fishing Spot", () {}),
                    containerTile("View my Spot", () {}),
                    containerTile("View my Spot", () {}),
                    containerTile("View my Catches", () {}),
                    containerTile("My Gear", () {}),
                  ],
                ),
              )),
              SizedBox(
                height: gridHeight! * 25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: gridHeight! * 1.5),
                      height: gridHeight! * 10,
                      //color: Colors.grey,
                      child: Row(
                        children: [
                          BottomIconButton(
                              gridHeight: gridHeight,
                              gridWidth: gridWidth,
                              path: "assets/Icon1.svg",
                              ontap: () {}),
                          BottomIconButton(
                              gridHeight: gridHeight,
                              gridWidth: gridWidth,
                              path: "assets/Icon2.svg",
                              ontap: () {}),
                          BottomIconButton(
                              gridHeight: gridHeight,
                              gridWidth: gridWidth,
                              path: "assets/Icon3.svg",
                              ontap: () {}),
                          BottomIconButton(
                              gridHeight: gridHeight,
                              gridWidth: gridWidth,
                              path: "assets/Icon4.svg",
                              ontap: () {}),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.end,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget containerTile(String name, Function ontap) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        height: gridHeight! * 8,
        margin: EdgeInsets.symmetric(vertical: gridHeight!),
        //width: gridWidth! * 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(gridHeight! * 1.5),
            color: const Color(4280039741),
            border: Border.all(color: Colors.white, width: gridHeight! * .07)),
        child: Center(
          child: Text(
            name,
            style: ScreenConfig.whiteH6,
          ),
        ),
      ),
    );
  }
}
