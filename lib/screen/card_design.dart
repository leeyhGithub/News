import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news_item_entity.dart';

class CardDesign extends StatelessWidget {
  CardDesign({Key? key, required this.article}) : super(key: key);
  NewsItemArticles article;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 20,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Expanded(
                    flex:1,
                    child: SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Card(
                            color: Color(0xff493fbf),
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 60,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        article.title ?? '',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xddffffff)),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        article.author ?? '',
                                        style: TextStyle(color: Color(0xaadddddd)),
                                      ),
                                      Text(article.publishedAt ?? '',
                                          style: TextStyle(color: Color(0xaadddddd)))
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              //이미지
              SizedBox(
                height: 150,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        // imageUrl: "https://picsum.photos/200",
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        imageUrl: article.urlToImage ?? '',
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/main.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }


}
