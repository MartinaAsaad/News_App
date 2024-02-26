import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/NewsTile.dart';
import 'package:news_app/models/articlemodel.dart';
import 'package:news_app/sevices/news_service.dart';

// class NewsListview extends StatefulWidget {
//   const NewsListview({
//     super.key,
//   });

//   @override
//   State<NewsListview> createState() => _NewsListviewState();
// }

class NewsListviewBuilder extends StatefulWidget {
  const NewsListviewBuilder({super.key, required this.category});
final String category;
  @override
  State<NewsListviewBuilder> createState() => _NewsListviewBuilderState();
}

class _NewsListviewBuilderState extends State<NewsListviewBuilder> {
  @override
  var future;
  void initState() {
    // TODO: implement initState
    super.initState();
future= NewsService(dio: Dio()).getNews(category:widget.category);
  }
  Widget build(BuildContext context) {
    return FutureBuilder<List<Articlemodel>>(
        future: future,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Newslist(articles: snapshot.data!);
          } else if (snapshot.hasError) {
          return const  SliverToBoxAdapter(
                child: ErrorMessage());
          } else {
           return const SliverToBoxAdapter(
                child: Laoding());
          }
        }));

    //isloading?SliverToBoxAdapter(child: Padding(
    //   padding: const EdgeInsets.only(top:100.0),
    //   child: Center(child: CircularProgressIndicator()),
    // )):articles.isNotEmpty? SliverList(

    //         delegate: SliverChildBuilderDelegate(

    //           childCount: articles.length,
    //           (context, index) {

    //         return newsTile(article: articles[index],);
    //        })):SliverToBoxAdapter(child: Padding(
    //          padding: const EdgeInsets.only(top:100.0),
    //          child: Center(child: Text('opps ,something happend please try later .')),
    //        ));
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Center(
      child: Text('opps ,something happend please try later .')),
                );
  }
}

class Laoding extends StatelessWidget {
  const Laoding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: EdgeInsets.only(top: 120.0),
                  child: Center(child: CircularProgressIndicator(color: Colors.grey,)),
                );
  }
}

class Newslist extends StatelessWidget {
  const Newslist({super.key, required this.articles});
  final List<Articlemodel> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: articles.length,
            (context, index) {
      return newsTile(
        article: articles[index],
      );
    }));
  }
}
