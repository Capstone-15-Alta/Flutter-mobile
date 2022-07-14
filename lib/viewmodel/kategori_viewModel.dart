import 'package:flutter/material.dart';
import 'package:forum_diskusi/model/api/kategori_api.dart';
import 'package:forum_diskusi/model/list_dropdown.dart';

class KategoriViewModel with ChangeNotifier {
  KategoriModel? _listKategori;
  KategoriModel? get listKategori => _listKategori;

  List<Data>? _kategoriFilter = [];
  List<Data>? get kategoriFilter => _kategoriFilter;

  getKategori() async {
    final allKategori = await KategoriAPI().getKategori();
    _listKategori = allKategori;
    print(allKategori!.data!.first.categoryName!.toString());
    notifyListeners();
  }

  filterKategoriId(String kategori) async {
    _kategoriFilter = _listKategori!.data!
        .where(
          (element) => element.categoryName!.toLowerCase().contains(
                kategori.toLowerCase(),
              ),
        )
        .toList();
        notifyListeners();
  }
}
