import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logacatch/main.dart';
import '../screen_config.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int errorIndex = 0;

  List<String?> errorList = [
    null,
    "invalid-email",
    "user-disabled",
    "wrong-password",
    "user-not-found",
    "Something went wrong"
  ];

  double? gridHeight, gridWidth;

  @override
  Widget build(BuildContext context) {
    ScreenConfig().read(context);
    gridHeight = ScreenConfig.gridHeight;
    gridWidth = ScreenConfig.gridWidth;
    // auth = Provider.of<Auth>(context, listen: false);
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: SizedBox(
        height: gridHeight! * 100,
        width: gridWidth! * 100,
        child: Column(children: [
          SizedBox(
            height: gridHeight! * 8,
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
          textField("Email", (String? value) {
            if (value == null) {
              return 'Please provide a valid Email.';
            }
            return errorList[errorIndex];
          }, _emailController, false),
          textField("Password", (String? value) {
            if (value == null) {
              return 'Please provide a password.';
            }
            return null;
          }, _passwordController, true),
          SizedBox(
            height: gridHeight! * 5,
          ),
          InkWell(
            onTap: () {
              logIn(context);
            },
            child: Container(
              height: gridHeight! * 11,
              width: gridHeight! * 11,
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
                shape: BoxShape.circle,
                border:
                    Border.all(color: Colors.white, width: gridHeight! * .1),
              ),
              child: Center(
                child: Text(
                  "Log In",
                  style: ScreenConfig.whiteH6,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  logIn(BuildContext context) async {
    try {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LogInPage()));
      });
    } on FirebaseAuthException catch (error) {
      String errorMessage = error.code;
      switch (errorMessage) {
        case "invalid-email":
          setState(() {
            errorIndex = 1;
          });
          break;
        case "user-disabled":
          setState(() {
            errorIndex = 2;
          });
          break;

        case "wrong-password":
          setState(() {
            errorIndex = 3;
          });
          break;
        case "user-not-found":
          setState(() {
            errorIndex = 4;
          });
          break;
        default:
          setState(() {
            errorIndex = 5;
          });
          break;
      }
      return;
      //throw error;
    }
  }

  Container textField(String hintText, String? Function(String?) validations,
      TextEditingController controller, bool isObscured) {
    return Container(
      // color: Colors.deepOrange,
      height: gridHeight! * 10,
      padding: EdgeInsets.symmetric(
          vertical: gridHeight!, horizontal: gridWidth! * 15),
      child: TextFormField(
        obscureText: isObscured,
        validator: validations,
        //maxLines: isObscured ? 1 : 3,
        decoration: InputDecoration(
          errorStyle: ScreenConfig.errortxt!,
          contentPadding: EdgeInsets.only(
              left: gridWidth! * 3,
              top: gridHeight! * 2,
              bottom: gridHeight! * 5),
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(gridHeight!),
              gapPadding: gridWidth! * 2,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(gridHeight!),
              gapPadding: gridWidth! * 2,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              )),
          filled: true,
          fillColor: Colors.white.withOpacity(.35),
        ),
        controller: controller,
      ),
    );
  }
}
