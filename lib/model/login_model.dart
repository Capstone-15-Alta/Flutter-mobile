// import 'package:flutter/material.dart';
class LoginModel{
  String? phoneNum;
  // String? username;
  String? password;

  LoginModel({this.phoneNum, this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(
      phoneNum: json['username'],
      // username: json['username'],
      password: json['password']

    );
  }
  Map<String, dynamic> toJson(){
    return { 
      'username': phoneNum,
      // 'username':username,
      'password': password
   };
  }

}