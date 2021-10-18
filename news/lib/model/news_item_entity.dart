import 'package:news/generated/json/base/json_convert_content.dart';

class NewsItemEntity with JsonConvert<NewsItemEntity> {
	String? status;
	int? totalResults;
	List<NewsItemArticles>? articles;
}

class NewsItemArticles with JsonConvert<NewsItemArticles> {
	NewsItemArticlesSource? source;
	String? author;
	String? title;
	String? description;
	String? url;
	String? urlToImage;
	String? publishedAt;
	String? content;
}

class NewsItemArticlesSource with JsonConvert<NewsItemArticlesSource> {
	dynamic? id;
	String? name;
}
