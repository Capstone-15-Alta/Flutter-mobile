// import 'package:flutter/material.dart';
class RegisterModel{
  String? username;
  String? email;
  String? password;

  RegisterModel({this.username, this.email,this.password});

  factory RegisterModel.fromJson(Map<String, dynamic> json){
    return RegisterModel(
      email: json['email'],
      username: json['username'],
      password: json['password']

    );
  }
  Map<String, dynamic> toJson(){
    return { 
      'email': email,
      'username': username,
      'password': password
   };
  }

}