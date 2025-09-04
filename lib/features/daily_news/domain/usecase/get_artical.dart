import 'package:new_app_clean_architeture/app/core/state/data_state.dart';
import 'package:new_app_clean_architeture/app/core/usecases/base_usecase.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/entities/article.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements Usecase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
