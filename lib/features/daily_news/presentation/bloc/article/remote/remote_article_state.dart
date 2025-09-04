import 'package:new_app_clean_architeture/app/core/network/app_exception.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState {
  const RemoteArticleState();
}

class RemoteArticleLoading extends RemoteArticleState {
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticleState {
  final List<ArticleEntity> articles;
  const RemoteArticleDone(this.articles);
}

class RemoteArticleError extends RemoteArticleState {
  final AppException error;
  const RemoteArticleError(this.error);
}
