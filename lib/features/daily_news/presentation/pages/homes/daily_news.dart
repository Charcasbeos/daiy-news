import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  _buildAppBar() {
    return AppBar(
      title: Text("Daily news", style: TextStyle(color: Colors.black)),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        if (state is RemoteArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is RemoteArticleError) {
          return const Center(child: Icon(Icons.headphones));
        }
        if (state is RemoteArticleDone) {
          print(state.articles![0]);

          print("UI received articles: ${state.articles?.length}");

          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              print(state.articles!.first.toString());
              return ArticleWidget(articleEntity: state.articles![index]);
            },
          );
        }
        return SizedBox();
      },
    );
  }
}
