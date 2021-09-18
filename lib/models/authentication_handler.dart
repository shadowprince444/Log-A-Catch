import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  String? _userId, _jwtToken, _userName, _email;
  // Auth({this.userId, this.email, this.userName, this.jwtToken});
  store(String? userId, String? jwtToken, String? userName, String? email) {
    this._email = email;
    this._jwtToken = jwtToken;
    this._userId = userId;
    this._userName = userName;
    print("----------------Auth Updated-----------------");

    print("----------------$userId-----------------");
    notifyListeners();
  }

  get jwtToken => _jwtToken;
  get userId => _userId;
  get email => _email;
  get userName => _userName;
}
