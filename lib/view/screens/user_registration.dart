import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logacatch/view/screens/email_otp_verification.dart';
import 'package:logacatch/view/screens/log_in_screen.dart';
import 'package:logacatch/view/widgets/background_screen.dart';

import '../screen_config.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({Key? key}) : super(key: key);
  @override
  _UserRegistrationState createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordReController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  String? email;
  bool isClicked = false;
  @override
  void initState() {
    if (isClicked) isClicked = false;
    super.initState();
  }

  double? gridHeight, gridWidth;
  @override
  Widget build(BuildContext context) {
    ScreenConfig().read(context);
    gridHeight = ScreenConfig.gridHeight;
    gridWidth = ScreenConfig.gridWidth;

    return SizedBox(
      height: gridHeight! * 100,
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: gridWidth! * 15),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: gridHeight! * 5),
                      child: Text(
                        "Registration",
                        style: ScreenConfig.blackH2Bold,
                      ),
                    ),
                    Expanded(child: Container()),
                    // Container(height: gridHeight!*8,margin: EdgeInsets.symmetric(vertical: gridHeight!),decoration: ,),
                    textField("First Name", (String? value) {
                      if (_firstNameController.text.isEmpty) {
                        return "Provide a First Name";
                      }

                      return null;
                    }, _firstNameController, false),
                    textField("Last Name", (String? value) {
                      if (_lastNameController.text.isEmpty) {
                        return "Provide a Last Name";
                      }
                      return null;
                    }, _lastNameController, false),
                    textField("Email", (String? value) {
                      if (_emailController.text.isEmpty) {
                        return "Provide an E-mail";
                      }
                      return null;
                    }, _emailController, false),
                    textField("Enter Password", (String? value) {
                      if (_passwordController.text.isEmpty) {
                        return "Provide a Password";
                      }
                      if (_passwordController.text !=
                          _passwordReController.text) {
                        return "password mismatch";
                      }
                      return null;
                    }, _passwordController, true),
                    textField("Re Enter Password", (String? value) {
                      if (_passwordReController.text.isEmpty) {
                        return "Re Enter your passwordk";
                      }
                      return null;
                    }, _passwordReController, true),

                    // TextFormField(
                    //  // maxLength: 10,
                    //   controller: _emailController,
                    //   keyboardType: TextInputType.emailAddress,
                    //   autofocus: false,
                    //   enableInteractiveSelection: true,
                    //   onChanged: (String? value) {
                    //     email = value;
                    //   },
                    //   validator: (value) {
                    //     if (email == null)
                    //       return 'Please provide an Email';
                    //     else {
                    //       // if (email!.)
                    //       //   return 'Please eneter a valid 10 digit number';
                    //       // else
                    //         return null;
                    //     }
                    //   },
                    //   decoration: InputDecoration(
                    //     hintStyle: ScreenConfig.label,

                    //     alignLabelWithHint: true,
                    //     counterText: "",
                    //     focusedBorder: ScreenConfig.borderStyle,
                    //     errorStyle: ScreenConfig.errortxt,
                    //     errorMaxLines: 2,
                    //     enabledBorder: ScreenConfig.enabledborderStyle,
                    //     labelStyle: ScreenConfig.blackH2,
                    //     filled: true,
                    //     fillColor: Colors.transparent,
                    //     labelText: 'Mobile Number',
                    //     floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: gridHeight! * 2,
                    // ),
                    // InkWell(
                    //   onTap: () {
                    //     _submit();
                    //   },
                    //   child: AnimatedContainer(
                    //     decoration: BoxDecoration(
                    //       borderRadius:
                    //           !isClicked ? BorderRadius.circular(10) : null,
                    //       shape: !isClicked
                    //           ? BoxShape.rectangle
                    //           : BoxShape.circle,
                    //       color: Colors.cyanAccent[700],
                    //     ),
                    //     height: gridHeight! * 6,
                    //     duration: Duration(microseconds: 500),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: !isClicked
                    //           ? Text(
                    //               "Send OTP",
                    //               style: ScreenConfig.label,
                    //             )
                    //           : Icon(
                    //               Icons.done,
                    //               color: Colors.white,
                    //             ),
                    //     ),
                    //   ),
                    // ),
                    // // ElevatedButton(
                    // //   onPressed: () {},
                    // //   child: Text('Send OTP'),
                    // //   style: ElevatedButton.styleFrom(
                    // //       elevation: 5,
                    // //       shadowColor: Colors.white,
                    // //       primary: Color(4279841857),
                    // //       onPrimary: Colors.white),
                    // // )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: gridHeight! * 31,
              // color: Colors.green,
              child: Column(
                children: [
                  SizedBox(
                    height: gridHeight! * 3.5,
                  ),
                  InkWell(
                    onTap: () {
                      _submit();
                    },
                    child: Container(
                      height: gridHeight! * 11,
                      width: gridHeight! * 11,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[900],
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white, width: gridHeight! * .1),
                      ),
                      child: Center(
                        child: Text(
                          "Proceed",
                          style: ScreenConfig.whiteH6,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.only(bottom: gridHeight! * 1.5),
                    height: gridHeight! * 10,
                    //color: Colors.grey,
                    child: Row(
                      children: [
                        bottomIconButton("assets/Icon1.svg", () {}),
                        bottomIconButton("assets/Icon2.svg", () {}),
                        bottomIconButton("assets/Icon3.svg", () {}),
                        bottomIconButton("assets/Icon4.svg", () {}),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomIconButton(String path, Function ontap) {
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

  Container textField(String hintText, String? Function(String?) validations,
      TextEditingController controller, bool isObscured) {
    return Container(
      // color: Colors.deepOrange,
      height: gridHeight! * 10,
      padding: EdgeInsets.symmetric(vertical: gridHeight!),
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
  // Widget textfield(String hint,TextEditingController controller,InputDecoration){

  // }

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    // UserCredential userCred =

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
        .then((value) {
      if (value.user != null) {
        value.user!.updateDisplayName(
            _firstNameController.text + " " + _lastNameController.text);

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmailOTPVerification(
                      emailId: _emailController.text,
                    )));
      } else {
        //  showAboutDialog(context:context,(context)=> AlertDialog(title: Text("An error occured",),,))
      }
    });

    //await Medicines().putMedicine();
    // await LogInApi().signUp(email).then((res) async {
    //   setState(() {
    //     isClicked = true;
    //   });
    //   await Future.delayed(Duration(seconds: 1));
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) =>
    //               VerifyOTP(_emailController.text) /* Demo()*/));
    // });
  }
}
