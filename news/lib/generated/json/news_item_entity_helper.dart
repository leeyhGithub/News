import 'package:news/model/news_item_entity.dart';

newsItemEntityFromJson(NewsItemEntity data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	if (json['totalResults'] != null) {
		data.totalResults = json['totalResults'] is String
				? int.tryParse(json['totalResults'])
				: json['totalResults'].toInt();
	}
	if (json['articles'] != null) {
		data.articles = (json['articles'] as List).map((v) => NewsItemArticles().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> newsItemEntityToJson(NewsItemEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['totalResults'] = entity.totalResults;
	data['articles'] =  entity.articles?.map((v) => v.toJson())?.toList();
	return data;
}

newsItemArticlesFromJson(NewsItemArticles data, Map<String, dynamic> json) {
	if (json['source'] != null) {
		data.source = NewsItemArticlesSource().fromJson(json['source']);
	}
	if (json['author'] != null) {
		data.author = json['author'].toString();
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	if (json['urlToImage'] != null) {
		data.urlToImage = json['urlToImage'].toString();
	}
	if (json['publishedAt'] != null) {
		data.publishedAt = json['publishedAt'].toString();
	}
	if (json['content'] != null) {
		data.content = json['content'].toString();
	}
	return data;
}

Map<String, dynamic> newsItemArticlesToJson(NewsItemArticles entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['source'] = entity.source?.toJson();
	data['author'] = entity.author;
	data['title'] = entity.title;
	data['description'] = entity.description;
	data['url'] = entity.url;
	data['urlToImage'] = entity.urlToImage;
	data['publishedAt'] = entity.publishedAt;
	data['content'] = entity.content;
	return data;
}

newsItemArticlesSourceFromJson(NewsItemArticlesSource data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'];
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> newsItemArticlesSourceToJson(NewsItemArticlesSource entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}