import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/NewsTile.dart';
import 'package:news_app/components/category.dart';
import 'package:news_app/components/categorylist.dart';
import 'package:news_app/components/newslist.dart';
import 'package:news_app/models/category.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/entertaiment.jpg', name: 'Entertainment'),
    CategoryModel(image: 'assets/science.jpg', name: 'Science'),
    CategoryModel(image: 'assets/health.jpg', name: 'Health'),
    CategoryModel(image: 'assets/technology.jpg', name: 'Technology'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'News',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Cloud',
                style:
                    TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child:CategoryListView(
              Clist: categories,
            )),
           NewsListviewBuilder(category: 'general',),
          ],
        ));
  }
}
