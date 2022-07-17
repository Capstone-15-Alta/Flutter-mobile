import 'package:flutter/material.dart';

class KategoriModel {
  String? timestamp;
  String? message;
  List<Data>? data;

  KategoriModel({this.timestamp, this.message, this.data});

  KategoriModel.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
    data = json['data'] != null
        ? (json['data'] as List).map((e) => Data.fromJson(e)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.first.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? categoryName;

  Data({this.id, this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    return data;
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("SD"), value: "SD"),
    const DropdownMenuItem(child: Text("SMP"), value: "SMP"),
    const DropdownMenuItem(child: Text("SMK/SMA"), value: "SMK/SMA"),
  ];
  return menuItems;
}
