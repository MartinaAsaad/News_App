import 'package:flutter/material.dart';
import 'package:news_app/components/category.dart';
import 'package:news_app/models/category.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,required this.Clist
  });
final List<CategoryModel> Clist;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        
        child: ListView.builder(
          
            scrollDirection: Axis.horizontal,
            itemCount: Clist.length,
            itemBuilder: ((context, index) {
              return CategoryCard(category: Clist[index]);
            })),
      ),
    );
  }
}
