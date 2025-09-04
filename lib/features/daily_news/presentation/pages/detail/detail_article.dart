import 'package:flutter/material.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/entities/article.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/widgets/custom_cached_image.dart';

class DetailArticle extends StatelessWidget {
  final ArticleEntity? articleEntity;
  const DetailArticle({super.key, this.articleEntity});

  @override
  Widget build(BuildContext context) {
    if (articleEntity == null) {
      return const Scaffold(body: Center(child: Text("No article data")));
    }
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [_buildTitle(), _buildImage(context), _buildDescription()],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(title: Text("Detail"));
  }

  Widget _buildImage(BuildContext context) {
    return Hero(
      tag: articleEntity!.urlToImage ?? "",
      child: CustomCachedImage(
        urlToImage: articleEntity!.urlToImage,
        widthImage: MediaQuery.of(context).size.width,
        heightImage: 200,
        borderRadiusImage: BorderRadius.circular(20),
        paddingImage: EdgeInsetsDirectional.all(10),
        marginImage: EdgeInsetsDirectional.all(0),
        colorImage: Colors.black,
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        children: [
          Text(
            articleEntity!.title ?? "",
            // overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 22,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
          // Datetime
          Align(
            alignment: Alignment.centerRight,
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.end,
              alignment: WrapAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.account_circle, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      articleEntity!.author ?? "",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[700],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.timeline_outlined, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      articleEntity!.publishedAt ?? "",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey[700],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Text(
        articleEntity!.description ?? "",
        style: TextStyle(fontSize: 14, height: 1.4),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
