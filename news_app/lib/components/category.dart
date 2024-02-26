import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return CategoryView(category: category.name);
        }));
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 200,
        child: Center(
            child: Text(
          category.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(category.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
          // color: Colors.amber,
        ),
      ),
    );
  }
}
