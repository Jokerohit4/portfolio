import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentArea(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        children: [
          _buildHeader(context),
          SpaceH40(),
          _buildArticleCards(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isMobile =
        MediaQuery.of(context).size.width < RefinedBreakpoints().tabletLarge;

    if (isMobile) {
      return NimbusInfoSection2(
        sectionTitle: StringConst.ARTICLES,
        title1: StringConst.ARTICLES_TITLE,
        hasTitle2: false,
        body: StringConst.ARTICLES_DESC,
      );
    }

    return SizedBox(
      width: widthOfScreen(context) * 0.6,
      child: NimbusInfoSection1(
        sectionTitle: StringConst.ARTICLES,
        title1: StringConst.ARTICLES_TITLE,
        hasTitle2: false,
        body: StringConst.ARTICLES_DESC,
      ),
    );
  }

  Widget _buildArticleCards(BuildContext context) {
    return ResponsiveBuilder(
      refinedBreakpoints: RefinedBreakpoints(),
      builder: (context, sizingInformation) {
        final screenWidth = sizingInformation.screenSize.width;
        final isMobile = screenWidth < RefinedBreakpoints().tabletLarge;

        if (isMobile) {
          return Column(
            children: Data.articles
                .map((article) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: _buildArticleCard(context, article),
                    ))
                .toList(),
          );
        }

        return Row(
          children: Data.articles
              .map((article) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: _buildArticleCard(context, article),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }

  Widget _buildArticleCard(BuildContext context, ArticleData article) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: article.externalUrl != null
          ? () => openUrlLink(article.externalUrl!, context)
          : null,
      child: Card(
        elevation: Sizes.ELEVATION_2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.RADIUS_8)),
        ),
        color: AppColors.black400,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withOpacity(0.15),
                ),
                child: Center(
                  child: Icon(
                    article.icon,
                    color: AppColors.primaryColor,
                    size: 28,
                  ),
                ),
              ),
              SpaceH24(),
              Text(
                article.category,
                style: textTheme.labelSmall?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              SpaceH12(),
              Text(
                article.title,
                style: textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              SpaceH16(),
              Text(
                article.description,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppColors.grey250,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SpaceH24(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Read more',
                    style: textTheme.labelMedium?.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.primaryColor,
                    size: 18,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
