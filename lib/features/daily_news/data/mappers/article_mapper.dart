import 'package:new_app_clean_architeture/features/daily_news/data/models/article.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/entities/article.dart';

class ArticleMapper {
  static ArticleEntity toEntity(ArticleModel model) {
    return ArticleEntity(
      author: model.author,
      title: model.title,
      description: model.description,
      url: model.url,
      urlToImage: model.urlToImage,
      publishedAt: model.publishedAt,
      content: model.content,
    );
  }

  static List<ArticleEntity> toEntityList(List<ArticleModel> models) {
    return models.map((e) => toEntity(e)).toList();
  }
}
