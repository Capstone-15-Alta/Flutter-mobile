import 'package:forum_diskusi/model/api/comment_api.dart';
import 'package:forum_diskusi/model/api/kategori_api.dart';
import 'package:forum_diskusi/model/api/login_api.dart';
import 'package:forum_diskusi/model/api/ranking_api.dart';
import 'package:forum_diskusi/model/api/search_api.dart';
import 'package:forum_diskusi/model/api/thread_api.dart';
import 'package:forum_diskusi/model/comment_model.dart';
import 'package:forum_diskusi/model/login_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([LoginAPI])
void main() {
  test('get all data on threads', () async {
    var threads = await ThreadAPI().getAllThread();
    expect(threads.isNotEmpty, true);
  });

  test('get all data on Ranking', () async {
    var ranking = await UserRankingAPI().getUserRanking();
    expect(ranking.isNotEmpty, true);
  });

  test('get all data on Trending', () async {
    var trending = await ThreadAPI().getTrendingThread();
    expect(trending.isNotEmpty, true);
  });

  test('get all data on Category', () async {
    var category = await KategoriAPI().getKategori();
    expect(category?.data != null, true);
  });
}
