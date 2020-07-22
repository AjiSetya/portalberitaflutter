import 'package:flutter/material.dart';
import 'package:news_app_api/models/ResponseBerita.dart';
import 'package:news_app_api/models/category.dart';
import 'package:news_app_api/views/news_item.dart';

import 'category_item.dart';

class NewsPage extends StatelessWidget {
  ResponseBerita responseBerita;
  List<Categorie> categories;

  NewsPage(this.responseBerita, this.categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      imageAssetUrl: categories[index].imageUrl,
                      categoryName: categories[index].categorieName,
                    );
                  }),
            ),
            Container(
                margin: EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: responseBerita.articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsItem(
                        imgUrl: responseBerita.articles[index].urlToImage ?? "",
                        title: responseBerita.articles[index].title ?? "",
                        desc: responseBerita.articles[index].description ?? "",
                        content: responseBerita.articles[index].content ?? "",
                        posturl: responseBerita.articles[index].url ?? "",
                        name: responseBerita.articles[index].source.name ?? "",
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
