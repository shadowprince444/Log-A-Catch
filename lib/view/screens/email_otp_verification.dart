import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:logacatch/view/screens/user_home_screen.dart';
import 'package:logacatch/view/widgets/background_screen.dart';

import '../screen_config.dart';

class EmailOTPVerification extends StatefulWidget {
  const EmailOTPVerification({Key? key, required this.emailId})
      : super(key: key);
  final String emailId;
  @override
  _EmailOTPVerificationState createState() => _EmailOTPVerificationState();
}

class _EmailOTPVerificationState extends State<EmailOTPVerification> {
  final TextEditingController _otpController = TextEditingController();
  EmailAuth emailAuth = EmailAuth(sessionName: "Sample session");
  bool isOtpSend = false;
  double? gridHeight, gridWidth;

  void sendOTP() async {
    EmailAuth(sessionName: "Log A Catch")
        .sendOtp(recipientMail: widget.emailId)
        .then((value) {
      setState(() {
        isOtpSend = value;
      });
    });
    // bool result = await emailAuth.sendOtp(recipientMail: widget.emailId);
    // setState(() {
    //   isOtpSend = result;
    // });
  }

  void verifyOTP(String otp) {
    bool isVerified = EmailAuth(sessionName: "Log A Catch")
        .validateOtp(recipientMail: widget.emailId, userOtp: otp);
    if (isVerified) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserHomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().read(context);
    gridHeight = ScreenConfig.gridHeight;
    gridWidth = ScreenConfig.gridWidth;
    return Background(
      foregroundWidget: SizedBox(
        height: gridHeight! * 100,
        width: gridWidth! * 100,
        child: Column(
          children: [
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
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: gridWidth! * 10),
              // color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(
                    height: gridHeight! * 6,
                  ),
                  Text(
                    isOtpSend
                        ? "The OTP has been sent"
                        : "Please verify your Email",
                    style: ScreenConfig.whiteH6,
                  ),
                  SizedBox(
                    height: gridHeight! * 5,
                  ),
                  textField(
                      widget.emailId,
                      (String? value) {},
                      _otpController,
                      false,
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(.6),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(gridHeight! * 2),
                                bottomRight: Radius.circular(gridHeight! * 2),
                              )),
                          width: gridWidth! * 20,
                          child: Center(
                            child: Text(
                              "Send OTP",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: gridHeight! * 2),
                            ),
                          ),
                        ),
                        onTap: sendOTP,
                      ),
                      true),
                  textField("Enter Your OTP", (String? value) {
                    if (value == null || value == "") {
                      return "Enter Your Verification OTP";
                    }
                    return null;
                  },
                      _otpController,
                      true,
                      const SizedBox(
                        height: 0,
                        width: 0,
                      ),
                      false),
                  SizedBox(
                    height: gridHeight! * 10,
                  ),
                  InkWell(
                    onTap: () {
                      verifyOTP(_otpController.text);
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
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Container textField(
      String hintText,
      String? Function(String?) validations,
      TextEditingController controller,
      bool isObscured,
      Widget trailing,
      bool isReadOnly) {
    print(hintText);
    return Container(
      // color: Colors.deepOrange,
      height: gridHeight! * 10,
      padding: EdgeInsets.symmetric(vertical: gridHeight!),
      child: TextFormField(
        style: ScreenConfig.whiteH6,
        obscureText: isObscured, readOnly: isReadOnly,
        initialValue: isReadOnly ? hintText : null,
        validator: validations,
        //maxLines: isObscured ? 1 : 3,
        decoration: InputDecoration(
          suffixIcon: trailing,
          errorStyle: ScreenConfig.errortxt!,
          contentPadding: EdgeInsets.only(
              left: gridWidth! * 3,
              top: gridHeight! * 2,
              bottom: isReadOnly ? gridHeight! : gridHeight! * 5),
          hintText: isReadOnly ? null : hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(gridHeight! * 2),
              gapPadding: gridWidth! * 2,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(gridHeight! * 2),
              gapPadding: gridWidth! * 2,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              )),
          filled: true,
          fillColor: Colors.white.withOpacity(.35),
        ),
        controller: isReadOnly ? null : controller,
      ),
    );
  }
}
