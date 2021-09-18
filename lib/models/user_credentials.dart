import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserModel {
  String? userId, jwtToken, userName, email;
  UserModel({this.userId, this.email, this.userName, this.jwtToken});
}

class UserCredentials with ChangeNotifier {
  UserModel _userModel = UserModel();
  //UserCredentials({this.userId, this.email, this.userName, this.jwtToken});
  updateUserCredentials(UserModel userModel) {
    if (userModel != this._userModel && userModel != null) {
      _userModel = userModel;
      print("userCredentials ${userModel.userId}");
      notifyListeners();
    }
  }

  postUserData() {}
}
