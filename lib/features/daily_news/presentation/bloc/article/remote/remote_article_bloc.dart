import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_clean_architeture/app/core/network/app_exception.dart';
import 'package:new_app_clean_architeture/app/core/state/data_state.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/usecase/get_artical.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase)
    : super(const RemoteArticleLoading()) {
    on<GetArticles>(_onGetArticles);
  }

  Future<void> _onGetArticles(
    GetArticles event,
    Emitter<RemoteArticleState> emit,
  ) async {
    emit(const RemoteArticleLoading()); // emit loading state đầu tiên
    try {
      final dataState = await _getArticleUseCase();

      if (dataState is DataSuccess) {
        final articles = dataState.data ?? [];
        if (articles.isNotEmpty) {
          emit(RemoteArticleDone(articles));
        } else {
          // Trường hợp data rỗng
          emit(const RemoteArticleDone([]));
        }
      } else if (dataState is DataError) {
        // AppException từ error handler
        final AppException error = dataState.error ?? UnknownException();
        emit(RemoteArticleError(error));
      }
    } catch (e) {
      // Catch bất kỳ lỗi unexpected nào
      final error = e is AppException ? e : UnknownException(e.toString());
      emit(RemoteArticleError(error));
    }
  }
}
