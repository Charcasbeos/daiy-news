import 'package:new_app_clean_architeture/app/core/state/data_state.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}
