import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:new_app_clean_architeture/app/core/network/dio_client.dart';
import 'package:new_app_clean_architeture/app/core/network/interceptors.dart';
import 'package:new_app_clean_architeture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:new_app_clean_architeture/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/repository/article_repository.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/usecase/get_artical.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependences() async {
  // Register DioClient (global)
  sl.registerLazySingleton<DioClient>(
    () => DioClient(
      baseUrl: "https://newsapi.org/v2",
      // interceptors: [LoggingInterceptor()],
    ),
  );

  // Nếu service cần Dio thay vì DioClient, có thể cung cấp trực tiếp
  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);

  // Dependencies
  sl.registerLazySingleton<NewsApiService>(() => NewsApiService(sl<Dio>()));
  sl.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(sl<NewsApiService>()),
  );

  // Usecase
  sl.registerLazySingleton<GetArticleUseCase>(
    () => GetArticleUseCase(sl<ArticleRepository>()),
  );

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(
    () => RemoteArticleBloc(sl<GetArticleUseCase>()),
  );
}
