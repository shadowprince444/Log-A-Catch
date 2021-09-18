import 'package:flutter/material.dart';
import 'package:logacatch/view/screens/user_registration.dart';
import 'package:logacatch/view/widgets/background_screen.dart';

import '../screen_config.dart';
import 'log_in_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool isLogIn = true;
  double? gridHeight, gridWidth;
  @override
  Widget build(BuildContext context) {
    ScreenConfig().read(context);
    gridHeight = ScreenConfig.gridHeight;
    gridWidth = ScreenConfig.gridWidth;
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Background(
            foregroundWidget: Stack(
          children: [
            isLogIn ? const LogInScreen() : const UserRegistration(),
            Positioned(
              left: gridWidth! * 20,
              bottom: gridHeight! * 10,
              child: isLogIn
                  ? Container(
                      padding: EdgeInsets.symmetric(vertical: gridHeight! * 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: ScreenConfig.blackH6,
                          ),
                          SizedBox(
                            width: gridWidth! * 2,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLogIn = false;
                              });
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const UserRegistration()));
                            },
                            child: SizedBox(
                              child: Text(
                                "Register now !",
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontSize: gridHeight! * 2.2),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(vertical: gridHeight!),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Do you have an account?",
                            style: ScreenConfig.blackH6,
                          ),
                          SizedBox(
                            width: gridWidth! * 2,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLogIn = true;
                              });

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const LogInScreen()));
                            },
                            child: SizedBox(
                              child: Text(
                                "Log-In !",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue[900],
                                    fontSize: gridHeight! * 2.2),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ],
        )));
  }

  // SizedBox initial(BuildContext context) {
  //   return SizedBox(
  //     height: gridHeight! * 100,
  //     width: gridWidth! * 100,
  //     child: Column(
  //       children: [
  //         SizedBox(
  //           height: gridHeight! * 18,
  //         ),
  //         SizedBox(
  //           height: gridHeight! * 40,
  //           width: gridWidth! * 60,
  //           child: Image.asset(
  //             "assets/appLogo.png",
  //             fit: BoxFit.contain,
  //           ),
  //         ),
  //         SizedBox(
  //           height: gridHeight! * 12,
  //         ),
  //         Container(
  //           padding: EdgeInsets.symmetric(horizontal: gridWidth! * 15),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               InkWell(
  //                 onTap: () {
  //                   Navigator.push(context,
  //                       MaterialPageRoute(builder: (context) => LogInScreen()));
  //                 },
  //                 child: Container(
  //                   height: gridHeight! * 11,
  //                   width: gridHeight! * 11,
  //                   decoration: BoxDecoration(
  //                     color: Colors.blueGrey[900],
  //                     shape: BoxShape.circle,
  //                     border: Border.all(
  //                         color: Colors.white, width: gridHeight! * .1),
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       "Log In",
  //                       style: ScreenConfig.whiteH6,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                           builder: (context) => UserRegistration()));
  //                 },
  //                 child: Container(
  //                   height: gridHeight! * 11,
  //                   width: gridHeight! * 11,
  //                   decoration: BoxDecoration(
  //                     color: Colors.blueGrey[900],
  //                     shape: BoxShape.circle,
  //                     border: Border.all(
  //                         color: Colors.white, width: gridHeight! * .1),
  //                   ),
  //                   child: Center(
  //                     child: Text(
  //                       "Sign Up",
  //                       style: ScreenConfig.whiteH6,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
