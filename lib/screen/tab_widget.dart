import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/generated/json/news_item_entity_helper.dart';
import 'package:news/model/news_item_entity.dart';

import 'article_details.dart';
import 'card_design.dart';

class TabWidget extends StatefulWidget {
  TabWidget({Key? key, required this.category}) : super(key: key);

  String category;
  List<NewsItemArticles> articles = [];

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  @override
  void initState() {
    super.initState();

    //decode
    getHttp();
  }

  Future<void> getHttp() async {
    try {
      //then : callback
      String url =
          "https://newsapi.org/v2/top-headlines?country=kr&apiKey=c8dc40ec45ad45ceb83ea2f2fa4cd172&category=";
      url += widget.category;

      Response response = await Dio().get(url);
      //'https://newsapi.org/v2/top-headlines?country=kr&apiKey=c8dc40ec45ad45ceb83ea2f2fa4cd172&category=health'

      print(response.data);
      if (response.statusCode == HttpStatus.ok) {
        NewsItemEntity newsItem = NewsItemEntity();
        newsItemEntityFromJson(newsItem, response.data);

        setState(() {
          widget.articles = newsItem.articles ?? [];
          // widget.testInt++;
          // widget.textString = "${widget.testInt}";
        });

        // print(widget.textString);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: RefreshIndicator(
            // onRefresh: () async => print('refresh!'),
            onRefresh: getHttp,
            child: ListView.builder(
              // physics: const AlwaysScrollableScrollPhysics(
              //   parent: BouncingScrollPhysics(),
              // ),
              itemBuilder: (context, index) {
                NewsItemArticles item = widget.articles[index];
                return GestureDetector(
                  child: CardDesign(article: widget.articles[index]),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ArticleDetails(article: item)));
                  },
                );
              },
              itemCount: widget.articles.length,
            ),
          ),
        ),
      ],
    );
  }
}
