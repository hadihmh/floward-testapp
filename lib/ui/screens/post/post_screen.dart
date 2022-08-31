import 'package:floward/domain/models/home_model.dart';
import 'package:floward/resources/screen_values.dart';
import 'package:floward/ui/widgets/post_widget.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key, required this.homeModel}) : super(key: key);

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: ScreenValues.imageLarge,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: homeModel.name,
                child: Image.network(
                  homeModel.thumbnailUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var item = homeModel.postsModel[index];

                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenValues.paddingSmall,
                      vertical: ScreenValues.paddingXSmall),
                  child: PostWidget(
                    title: item.title,
                    body: item.body,
                  ),
                );
              },
              childCount: homeModel.postsModel.length,
            ),
          ),
        ],
      ),
    );
  }
}
