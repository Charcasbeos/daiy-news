import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_clean_architeture/app/config/theme/app_themes.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/pages/homes/daily_news.dart';
import 'package:new_app_clean_architeture/injection_container.dart';

void main() {
  initializeDependences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: DailyNews(),
      ),
    );
  }
}
