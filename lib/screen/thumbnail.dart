import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/model/news_item_entity.dart';
import '../main.dart';

class ThumbnailScreen extends StatefulWidget {
  ThumbnailScreen({Key? key, required this.article}) : super(key: key);

  NewsItemArticles article;

  @override
  _ThumbnailScreenState createState() => _ThumbnailScreenState();
}

class _ThumbnailScreenState extends State<ThumbnailScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Card(
      color: Color(0xeeffffff),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.7,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Row(
              children: [
                Container(
                  width: size.width * 0.15,
                  height: size.width * 0.15,
                  // child: Image.asset('assets/main.png')
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: CachedNetworkImage(
                      // imageUrl: "https://picsum.photos/200",
                      placeholder: (context, url) => CircularProgressIndicator(),
                      imageUrl:  widget.article.urlToImage ?? '',
                      // errorWidget: (context, url, error) => Icon(Icons.error),
                      errorWidget: (context, url, error) => Image.asset("assets/main.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                //title
                SizedBox(
                  width: 13,
                ),
                SizedBox(
                  width: 250 ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.article.title ?? '', overflow: TextOverflow.ellipsis, maxLines: 1),
                      Text(widget.article.publishedAt ?? ''),
                    ],
                  ),
                ),
                //time
                SizedBox(width: 10,),
              ],
            ),
            //preview content
            SizedBox(
              height: 13,
            ),
            Text( widget.article.description ?? '',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        )),
      ),
    );
  }
}
