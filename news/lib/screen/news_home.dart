import 'package:flutter/material.dart';
import 'package:news/model/news_item_entity.dart';
import 'package:news/screen/tab_widget.dart';


class NewsHomeApp extends StatefulWidget {
  NewsHomeApp({Key? key}) : super(key: key);

  List<Map> categoryArray = [
    {'name': 'general', 'text': '전체'},
    {'name': 'business', 'text': '비즈니스'},
    {'name': 'entertainment', 'text': '엔터테인먼트'},
    {'name': 'health', 'text': '건강'},
    {'name': 'science', 'text': '과학'},
    {'name': 'sports', 'text': '스포츠'},
    {'name': 'technology', 'text': '기술'},
  ];

  String category = "";
  List<NewsItemArticles> articles = [];

  @override
  _NewsHomeAppState createState() => _NewsHomeAppState();
}

class _NewsHomeAppState extends State<NewsHomeApp> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: Color(0xff2d2680),
        body: TabBarView(
          children: [
            TabWidget(category: widget.categoryArray[0]['name']),
            TabWidget(category: widget.categoryArray[1]['name']),
            TabWidget(category: widget.categoryArray[2]['name']),
            TabWidget(category: widget.categoryArray[3]['name']),
            TabWidget(category: widget.categoryArray[4]['name']),
            TabWidget(category: widget.categoryArray[5]['name']),
            TabWidget(category: widget.categoryArray[6]['name']),
          ],
        ),
        appBar: AppBar(
          toolbarHeight: 50,
          title: Text('Today News'),
          backgroundColor: Color(0xff181354),
          titleTextStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff)),
          bottom: PreferredSize(
            preferredSize: Size(50, 40),
            child: Container(
              color: Color(0xff282f76),
              height: 40,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                child: TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  isScrollable: true,
                  automaticIndicatorColorAdjustment: true,
                  indicatorWeight: 2,
                  tabs: [
                    Tab(
                      // icon: Icon(Icons.access_alarm),Z
                        child: Text(
                          widget.categoryArray[0]['text'],
                          style: TextStyle(color: Colors.yellow),
                        )),
                    Tab(
                      // icon: Icon(Icons.account_circle),
                      text: widget.categoryArray[1]['text'],
                    ),
                    Tab(
                      // icon: Icon(Icons.camera),
                      text: widget.categoryArray[2]['text'],
                    ),
                    Tab(
                      // icon: Icon(Icons.camera),
                      text: widget.categoryArray[3]['text'],
                    ),
                    Tab(
                      // icon: Icon(Icons.camera),
                      text: widget.categoryArray[4]['text'],
                    ),
                    Tab(
                      // icon: Icon(Icons.camera),
                      text: widget.categoryArray[5]['text'],
                    ),
                    Tab(
                      // icon: Icon(Icons.camera),
                      text: widget.categoryArray[6]['text'],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}