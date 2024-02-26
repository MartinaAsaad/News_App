import 'package:flutter/material.dart';
import 'package:news_app/components/newslist.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key,required this.category});
final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          NewsListviewBuilder(category: category,),
        ],
      ),
    );
  }
}