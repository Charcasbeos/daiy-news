import 'dart:io';
import 'package:dio/dio.dart';
import 'package:new_app_clean_architeture/app/core/constants/constants.dart';
import 'package:new_app_clean_architeture/app/core/network/app_exception.dart';
import 'package:new_app_clean_architeture/app/core/network/error_handler.dart';
import 'package:new_app_clean_architeture/app/core/state/data_state.dart';
import 'package:new_app_clean_architeture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:new_app_clean_architeture/features/daily_news/data/mappers/article_mapper.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/entities/article.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        country: countryQuery,
        category: category,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        // Convert Model -> Entity trước khi trả về
        final entities = ArticleMapper.toEntityList(httpResponse.data);
        return DataSuccess(entities);
      } else {
        // Map DioException sang AppException
        final appError = ErrorHandler.map(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
        return DataError(appError);
      }
    } on DioException catch (e) {
      // Convert DioException -> AppException
      final appError = ErrorHandler.map(e);
      return DataError(appError);
    } catch (e) {
      // Convert các lỗi không phải DioException -> UnknownException
      return DataError(UnknownException(e.toString()));
    }
  }
}
