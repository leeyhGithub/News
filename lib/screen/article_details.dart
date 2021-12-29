import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:news/model/news_item_entity.dart';

class ArticleDetails extends StatelessWidget {
  ArticleDetails({Key? key, required this.article}) : super(key: key);
  NewsItemArticles article;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff8359c2),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('News'),
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                article.title ?? '',
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.author ?? 'unknown',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    article.publishedAt ?? '-',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: size.width,
              child: GestureDetector(
                onLongPress: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(title: Text("저장하시겠습니까?"),actions: [
                    OutlinedButton(onPressed: (){
                      _save(context);
                    }, child: Text("저장")),
                    OutlinedButton(onPressed: () => Navigator.pop(context, 'Cancel'), child: Text("취소")),
                  ],)
                ),
                child: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: article.urlToImage ?? '',
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/main.png"),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(article.description ?? '',
                  style: TextStyle(fontSize: 15)),
            ),
          ])),
        ),
      ),
    );
  }

  _save(BuildContext context) async {
    var response = await Dio().get(
        article.urlToImage ?? "",
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");

    Navigator.pop(context);
    print(result);
  }
}



