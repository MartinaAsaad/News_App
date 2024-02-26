import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/articlemodel.dart';
import 'package:news_app/sevices/news_service.dart';
import 'package:news_app/views/home_view.dart';

void main() {

  runApp(const NewsApp());
  
}

final dio = Dio();
void getnews() async {
  final response = await dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=96df89dd81c64ca595643d7ff38f61d0');
  print(response);
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
