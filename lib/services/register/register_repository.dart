import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterProvider {
  Future googleSignInProvider() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    GoogleSignInAccount currentUser;
    try {
      _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
        currentUser = account;
        if (currentUser != null) {
          _handleGetContact(currentUser);
        }
      });
      _googleSignIn.signInSilently();

      currentUser = await _googleSignIn.signIn();
    } catch (e) {
      debugPrint("RegisterProvider - googleSignInProvider: {$e}");
    }
  }

  Future _handleGetContact(GoogleSignInAccount currentUser) async {
    Map<String, String> header = await currentUser.authHeaders;
    var dio = Dio(BaseOptions(
      headers: header,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ));

    Response response = await dio.get(
        'https://people.googleapis.com/v1/people/me/connections?requestMask.includeField=person.names');
    print(response.data);
    dio.close();
  }
}
