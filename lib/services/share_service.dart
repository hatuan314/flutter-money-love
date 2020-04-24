//import 'dart:convert';
//import 'package:flutter/services.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:flutterapp/models/profile.dart';
//
//class ShareService {
//  static final ShareService _singleton = new ShareService._internal();
//
//  factory ShareService() {
//    return _singleton;
//  }
//
//  ShareService._internal();
//
//  String _token;
//  Map<String, String> _rolesMap = Map<String, String>();
//  Profile _profile;
//
//  Map<String, String> get rolesMap => _rolesMap;
//  set rolesMap(Map<String, String> value) {
//    _rolesMap = value;
//  }
//
//  String get token => _token;
//  set token(String value) {
//    _token = value;
//  }
//
//  Profile get profile => _profile;
//  set profile(profile) {
//    _profile = profile;
//  }
//
//  /// TOKEN
//  Future<void> persistCustomerToken(String token) async {
//    this.token = token;
//    final storage = new FlutterSecureStorage();
//    await storage.write(key: "token", value: this.token);
//  }
//
//  Future<String> retrieveCustomerToken() async {
//    if (this.token != null) {
//      return this.token;
//    }
//
//    final storage = new FlutterSecureStorage();
//
//    String username = await storage.read(key: "token");
//    this.token = username;
//    return this.token;
//  }
//
//  /// LOGOUT
//  Future<void> deleteAll() async {
//    final storage = new FlutterSecureStorage();
//
//    await storage.deleteAll();
//  }
//}
