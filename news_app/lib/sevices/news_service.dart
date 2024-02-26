import 'package:dio/dio.dart';
import 'package:news_app/models/articlemodel.dart';

class NewsService {
  final Dio dio;
  NewsService({required this.dio});
  Future<List<Articlemodel>> getNews({required String category}) async {
    
    Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=96df89dd81c64ca595643d7ff38f61d0');

    Map<String, dynamic> jsondata = response.data;
    List<dynamic> articles = jsondata['articles'];
    List<Articlemodel> articleslist = [];
    for (var element in articles) {
      articleslist.add(Articlemodel(
          image: element['urlToImage'],
          title: element['title'],
          subtitle: element['description']));
    }
   return articleslist;
  }
  
}
