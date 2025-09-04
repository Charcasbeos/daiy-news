import 'package:flutter/material.dart';
import 'package:new_app_clean_architeture/features/daily_news/domain/entities/article.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/pages/detail/detail_article.dart';
import 'package:new_app_clean_architeture/features/daily_news/presentation/widgets/custom_cached_image.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? articleEntity;
  const ArticleWidget({super.key, this.articleEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailArticle(articleEntity: articleEntity),
          ),
        );
      },
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 14),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [_buildImage(context), _buildTitleAndDescription()],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Hero(
      tag: articleEntity!.urlToImage ?? "",
      child: CustomCachedImage(
        urlToImage: articleEntity!.urlToImage,
        widthImage: MediaQuery.of(context).size.width / 3,
        heightImage: double.maxFinite,
        borderRadiusImage: BorderRadius.circular(20),
        paddingImage: EdgeInsetsDirectional.only(end: 14),
        marginImage: EdgeInsetsDirectional.all(0),
        colorImage: Colors.black,
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              articleEntity!.title ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            // Description
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(articleEntity!.description ?? "", maxLines: 2),
              ),
            ),
            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  articleEntity!.publishedAt ?? "",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
