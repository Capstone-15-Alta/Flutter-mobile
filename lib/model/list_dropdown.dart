// class KategoriModel {
//   String? timestamp;
//   String? message;
//   Data? data;

//   KategoriModel({this.timestamp, this.message, this.data});

//   KategoriModel.fromJson(Map<String, dynamic> json) {
//     timestamp = json['timestamp'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['timestamp'] = timestamp;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }

//   void getKategori() {}
// }

// class Data {
//   int? id;
//   String? categoryName;

//   Data({this.id, this.categoryName});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryName = json['category_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['category_name'] = categoryName;
//     return data;
//   }
// }