import 'package:flutter/material.dart';
import 'package:news_app/models/articlemodel.dart';

class newsTile extends StatelessWidget {
  const newsTile({
    super.key,required this.article
  });
final Articlemodel article;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal :8.0,vertical: 10),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.image??'https://th.bing.com/th/id/OIP.gV1cXI_SNBK_nU1yrE_hcwHaGp?rs=1&pid=ImgDetMain'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
              // color: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(article.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,height: 0,),overflow: TextOverflow.ellipsis,maxLines: 2,),
          ),
          Text(article.subtitle??'',style: TextStyle(color: Colors.grey),maxLines: 2,overflow: TextOverflow.ellipsis,)
      
        ],
      ),
    );
  }
}
